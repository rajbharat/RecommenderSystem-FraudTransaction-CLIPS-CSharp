using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ISBADAL;
using ISBADBML;

namespace ISBARecoPrj
{
    public class SuspiciousTxn
    {

        #region Declarations

            public TransactionFilteringDataContext _custDataCtx = null;
            List<Customer_Data> _customerList = new List<Customer_Data>();
            List<Transaction_Data> _txnList = new List<Transaction_Data>();
            List<Rule_Parameter> _scenarioList = new List<Rule_Parameter>();        
            bool _hasChange = false;
        #endregion

        #region Properties

        public TransactionFilteringDataContext CustDataContext => _custDataCtx;

            public List<Rule_Parameter> ScnList => _scenarioList;

            public List<Customer_Data> CustList
            {
                get { return _customerList; }
                set { _customerList = value; }
            }

            public  List<Transaction_Data> TranList
            {
                get { return _txnList; }
                set { _txnList = value; }
            }
            public bool HasChange
            {
                get
                {
                    var changes = _custDataCtx.GetChangeSet();
                    _hasChange = changes.Updates.Where(x => x is Rule_Parameter).Any();
                    return _hasChange;
                }
            }
            
        #endregion

        #region Constructors

        public SuspiciousTxn()
            {
                _custDataCtx = new TransactionFilteringDataContext() ;
                _custDataCtx.Log = Console.Out;
                Initialize();
        }

        #endregion

        #region BuildData

        public void Initialize()
        {
            _customerList.Clear();
            _txnList.Clear();
            _scenarioList.Clear();
            _scenarioList = _custDataCtx.Rule_Parameters.ToList<Rule_Parameter>();
            _customerList = _custDataCtx.Customer_Datas.ToList<Customer_Data>();
            _txnList = _custDataCtx.Transaction_Datas.ToList<Transaction_Data>();
        }

        public void CleanFacts()
            {
                _custDataCtx.Customer_Datas.Truncate<Customer_Data>();
                _custDataCtx.Transaction_Datas.Truncate<Transaction_Data>();
                _custDataCtx.SubmitChanges();
            }

        public void UploadCustomerData(List<Customer_Data> cList)
        {
            _custDataCtx.Customer_Datas.Truncate<Customer_Data>();
            _customerList.Clear();
            _custDataCtx.Customer_Datas.InsertAllOnSubmit<Customer_Data>(cList);
            _custDataCtx.SubmitChanges();            
            _customerList = CustDataContext.Customer_Datas.ToList<Customer_Data>();
        }

        public void UploadTxnData(List<Transaction_Data> trxList)
        {
            _custDataCtx.Transaction_Datas.Truncate<Transaction_Data>();
            _txnList.Clear();
            _custDataCtx.Transaction_Datas.InsertAllOnSubmit<Transaction_Data>(trxList);
            _custDataCtx.SubmitChanges();            
            _txnList = CustDataContext.Transaction_Datas.ToList<Transaction_Data>();
        }

      
        public  void SaveChanges()
        {
            _custDataCtx.SubmitChanges();
            _scenarioList.Clear();
            _scenarioList = _custDataCtx.Rule_Parameters.ToList<Rule_Parameter>();

        }

        public void DiscardChanges()
        {
            _custDataCtx.Dispose();
        }

        #endregion
    }
}
