using ISBADAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.OleDb;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Mommosoft.ExpertSystem;
using LumenWorks.Framework.IO.Csv;
using System.IO;
using Excel;
namespace ISBARecoPrj
{
    public partial class ISBATxnGUI : Form
    {
        #region Declarations
        private Mommosoft.ExpertSystem.Environment enviroment;
        private bool _gridEnable = true;
        private SuspiciousTxn susTxn;

        private class FactsData
        {
            public string CustType { get; set; }
            public string CustID { get; set; }
            public string CustRisk { get; set; }
            public int FTC_IND { get; set; }
        }
        
        #endregion

        #region Helpers
        private static string FilePath()
        {
            OpenFileDialog theDialog = new OpenFileDialog();
            theDialog.Title = "Open Text File";
            theDialog.Filter = "Excel files|*.xlsx";
            theDialog.InitialDirectory = @"C:\ISBARecoPrj\ISBARecoPrj\";

            if (theDialog.ShowDialog() == DialogResult.OK)
            {
                MessageBox.Show("Spreadsheet Selected for Upload");
            }
            return theDialog.FileName.ToString();
        }

        private void Initialize()
        {
            BindingSource bindingScnList = new BindingSource();
            susTxn = new SuspiciousTxn();
            susTxn.CleanFacts();
            enviroment = new Mommosoft.ExpertSystem.Environment();
            bindingScnList.DataSource = susTxn.ScnList;
            dataGridViewRules.DataSource = bindingScnList;
        }
        #endregion

        #region Constructor

        public ISBATxnGUI()
        {
            InitializeComponent();
            Initialize();
            
        }
        #endregion

        #region "Preprocessing"

        private static DataTable UploadFile(String fileName)
        {
            String excelConnString = String.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=\"Excel 12.0\"", fileName);
            DataTable dt = new DataTable();
            using (OleDbConnection excelConnection = new OleDbConnection(excelConnString))
            {
                using (OleDbCommand cmd = new OleDbCommand("Select * from [Sheet1$]", excelConnection))
                {
                    excelConnection.Open();
                    using (OleDbDataReader dReader = cmd.ExecuteReader())
                    {
                        if (dReader.HasRows && dReader.IsClosed != true)
                            dt.Load(dReader);

                        //using (SqlBulkCopy sqlBulk = new SqlBulkCopy(strConnection))
                        //{
                        //    //Give your Destination table name 
                        //    sqlBulk.DestinationTableName = Table;
                        //    sqlBulk.WriteToServer(dReader);
                        //}
                    }
                }
            }
            return dt;
        }

        #endregion

        #region Form Events

        private void BtnCustFile_Click(object sender, EventArgs e)
        {
            txtCustomerFile.Text = FilePath();
        }

        private void BtnCustUpload_Click_1(object sender, EventArgs e)
        {
            DataTable custTable = new DataTable();
            custTable=  UploadFile(txtCustomerFile.Text);
            List<Customer_Data> custList = new List<Customer_Data>();

            custList = custTable.ToList<Customer_Data>();
            susTxn.UploadCustomerData(custList);
            MessageBox.Show("Customer Data Uploaded!");
            custTable = null;
        }

        private void BtnTrxFile_Click(object sender, EventArgs e)
        {
            txtTrxFile.Text = FilePath();
        }

        private void BtnTrxUpload_Click_1(object sender, EventArgs e)
        {
            DataTable txnTable =  new DataTable();
            txnTable = UploadFile(txtTrxFile.Text);
            List<Transaction_Data> txnList = new List<Transaction_Data>();

            txnList = txnTable.ToList<Transaction_Data>();
            susTxn.UploadTxnData(txnList);
            MessageBox.Show("Transaction Data Uploaded!");
            txnTable = null;
        }

        private void Btn_Engine_Click_1(object sender, EventArgs e)
        {
            File.Delete("C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv");

            GenerateFacts();

            MessageBox.Show("Execution Success!! Download Detailed Report for summary of recommendations.");
        }

        /// <summary>
        /// Lock Or Unlocck Grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void BtnLockGrid_Click(object sender, EventArgs e)
        {
            btnLockGrid.Text = _gridEnable ? "Lock Grid" : "Un Lock Grid";
            dataGridViewRules.Enabled = _gridEnable;
            _gridEnable = !_gridEnable;
        }

        /// <summary>
        /// Save Changes
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void BtnSaveParams_Click(object sender, EventArgs e)
        {
            if (susTxn.HasChange)
            {
                susTxn.SaveChanges();

                MessageBox.Show("Changes saved! Unlock Rules Grid to Modify the Parameters.");
            }
            btnLockGrid.PerformClick();
        }
        /// <summary>
        /// Grid Value Change Event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>        
        private void DataGridViewRules_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int Rule_ID = int.Parse(dataGridViewRules.Rows[e.RowIndex].Cells[0].Value.ToString());
                string Rule_Short_Name = dataGridViewRules.Rows[e.RowIndex].Cells[1].Value.ToString();
                string Rule_Description = dataGridViewRules.Rows[e.RowIndex].Cells[2].Value.ToString();
                string Cust_Type = dataGridViewRules.Rows[e.RowIndex].Cells[3].Value.ToString();
                int? Tot_Trx_Amount = int.TryParse(dataGridViewRules.Rows[e.RowIndex].Cells[4].Value.ToString(), out var trxAmt) ? trxAmt : (int?)null;
                int? Tot_Trx_Count = int.TryParse(dataGridViewRules.Rows[e.RowIndex].Cells[5].Value.ToString(), out var trxCnt) ? trxCnt : (int?)null;
                bool? isDenom = bool.TryParse(dataGridViewRules.Rows[e.RowIndex].Cells[6].Value.ToString(), out var bDenom) ? bDenom : (bool?)null;
                int? dr_txn_amount = int.TryParse(dataGridViewRules.Rows[e.RowIndex].Cells[7].Value.ToString(), out var dr_txn) ? dr_txn : (int?)null;
                int? dr_trx_cnt = int.TryParse(dataGridViewRules.Rows[e.RowIndex].Cells[8].Value.ToString(), out var dr_trx) ? dr_trx : (int?)null;
                int? cr_trx_amt = int.TryParse(dataGridViewRules.Rows[e.RowIndex].Cells[9].Value.ToString(), out var cr_trx) ? cr_trx : (int?)null;
                int? cr_txn_cnt = int.TryParse(dataGridViewRules.Rows[e.RowIndex].Cells[10].Value.ToString(), out var cr_txn) ? cr_txn : (int?)null;
                int? cust_risk = int.TryParse(dataGridViewRules.Rows[e.RowIndex].Cells[11].Value.ToString(), out var cst_risk) ? cst_risk : (int?)null;
                bool? ftc_ind = bool.TryParse(dataGridViewRules.Rows[e.RowIndex].Cells[12].Value.ToString(), out var bftc) ? bftc : (bool?)null;

                var RuleChanged = susTxn._custDataCtx.Rule_Parameters.Where(x => x.Rule_ID == Rule_ID).First();
                //var RuleChanges = from ord in susTxn.CustDataContext.Rule_Parameters
                //  where ord.Rule_ID == Rule_ID
                // select ord;

                if (!(RuleChanged is null))
                {
                    //foreach (Rule_Parameter RuleChanged in RuleChanges)
                    {
                        RuleChanged.Rule_Short_Name = Rule_Short_Name;
                        RuleChanged.Rule_Description = Rule_Description;
                        RuleChanged.Cust_Type = Cust_Type;
                        RuleChanged.Tot_Trx_Amount = Tot_Trx_Amount;
                        RuleChanged.Tot_Trx_Count = Tot_Trx_Count;
                        RuleChanged.isDenom = isDenom;
                        RuleChanged.dr_txn_amount = dr_txn_amount;
                        RuleChanged.dr_trx_cnt = dr_trx_cnt;
                        RuleChanged.cr_trx_amt = cr_trx_amt;
                        RuleChanged.cr_txn_cnt = cr_txn_cnt;
                        RuleChanged.cust_risk = cust_risk;
                        RuleChanged.ftc_ind = ftc_ind;
                        //
                        Console.WriteLine("*******" + susTxn.HasChange);
                        MessageBox.Show(String.Format("Rules Modified for Rule / Scenario: {0} - {1} : {2} ", Rule_ID.ToString(), Rule_Short_Name, Rule_Description));
                        //susTxn._custDataCtx.SubmitChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Unable to save the record. There might be a blank cell. " + ex.Message.ToString(), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        /// <summary>
        /// Form Closing Event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ISBATxnGUI_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (susTxn.HasChange)
            {
                DialogResult result = MessageBox.Show("Would you like to save your changes", "Save?", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Stop);
                if (result == DialogResult.Yes)
                {
                    btnSaveParams.PerformClick();
                }
                else if (result == DialogResult.Cancel)
                {
                    // Stop the closing and return to the form
                    e.Cancel = true;
                }
            }

        }

        private void Btn_Download_Report_Click(object sender, EventArgs e)
        {
            ReadCsv();
        }

        #endregion

        #region Clips Transformation & Clips Execution
        /// <summary>
        /// Generate Parameters for Rules
        /// </summary>
        private void GenerateRuleParams()
        {
            var curRule = susTxn.ScnList.Where(x => x.Rule_ID == 1).First();
            
            //Rule 1
            RuleGeneratorTemplate.MyHT["scn1_ind_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn1_ind_trxn_cnt"] = curRule.Tot_Trx_Count;
            RuleGeneratorTemplate.MyHT["scn1_ind_ftc_ind"] = bool.TryParse(curRule.ftc_ind.ToString(), out var bftc1) ? 1 : 0;
            RuleGeneratorTemplate.MyHT["scn1_ind_denom_ind"] = bool.TryParse(curRule.isDenom.ToString(), out var bDenom) ? 1 : 0;
            RuleGeneratorTemplate.MyHT["scn1_cust_risk_th"] = curRule.cust_risk;

            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 2).First();
            RuleGeneratorTemplate.MyHT["scn1_org_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn1_org_trxn_cnt"] = curRule.Tot_Trx_Count;
            RuleGeneratorTemplate.MyHT["scn1_org_ftc_ind"] = bool.TryParse(curRule.ftc_ind.ToString(), out var bftc2) ? 1 : 0;
            RuleGeneratorTemplate.MyHT["scn1_org_denom_ind"] = bool.TryParse(curRule.isDenom.ToString(), out var bDenom1) ? 1 : 0;
            RuleGeneratorTemplate.MyHT["scn1_cust_risk_th2"] = curRule.cust_risk;

            // Rule 2
            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 3).First();
            RuleGeneratorTemplate.MyHT["scn2_ind_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn2_ind_denom_ind"] = bool.TryParse(curRule.isDenom.ToString(), out var bDenom2) ? 1 : 0;
            RuleGeneratorTemplate.MyHT["scn2_cust_risk_th"] = curRule.cust_risk;

            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 4).First();
            RuleGeneratorTemplate.MyHT["scn2_org_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn2_org_denom_ind"] = bool.TryParse(curRule.isDenom.ToString(), out var bDenom3) ? 1 : 0;
            RuleGeneratorTemplate.MyHT["scn2_cust_risk_th2"] = curRule.cust_risk;

            //Rule 3
            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 5).First();
            RuleGeneratorTemplate.MyHT["scn3_ind_trxn_cnt"] = curRule.Tot_Trx_Count;
            RuleGeneratorTemplate.MyHT["scn3_ind_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn3_ind_denom_ind"] = bool.TryParse(curRule.isDenom.ToString(), out var bDenom4) ? 1 : 0;
            RuleGeneratorTemplate.MyHT["scn3_cust_risk_th"] = curRule.cust_risk;

            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 6).First();
            RuleGeneratorTemplate.MyHT["scn3_org_trxn_cnt"] = curRule.Tot_Trx_Count;
            RuleGeneratorTemplate.MyHT["scn3_org_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn3_org_denom_ind"] = bool.TryParse(curRule.isDenom.ToString(), out var bDenom5) ? 1 : 0;
            RuleGeneratorTemplate.MyHT["scn3_cust_risk_th2"] = curRule.cust_risk;
            //Rule4
            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 7).First();
            RuleGeneratorTemplate.MyHT["scn4_ind_trxn_cnt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn4_ind_trxn_amt"] = curRule.Tot_Trx_Count;
            RuleGeneratorTemplate.MyHT["scn4_ind_denom_ind"] = bool.TryParse(curRule.isDenom.ToString(), out var bDenom6) ? 1 : 0;
            RuleGeneratorTemplate.MyHT["scn4_ind_dr_trxn_amt"] = curRule.dr_txn_amount;
            RuleGeneratorTemplate.MyHT["scn4_ind_cr_trxn_amt"] = curRule.cr_trx_amt;
            RuleGeneratorTemplate.MyHT["scn4_cust_risk_th"] = curRule.cust_risk;

            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 8).First();
            RuleGeneratorTemplate.MyHT["scn4_org_trxn_cnt"] = curRule.Tot_Trx_Count;
            RuleGeneratorTemplate.MyHT["scn4_org_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn4_org_denom_ind"] = curRule.isDenom;
            RuleGeneratorTemplate.MyHT["scn4_org_dr_trxn_amt"] = curRule.dr_txn_amount;
            RuleGeneratorTemplate.MyHT["scn4_org_cr_trxn_amt"] = curRule.cr_trx_amt;
            RuleGeneratorTemplate.MyHT["scn4_cust_risk_th2"] = curRule.cust_risk;
            //Rule 5
            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 9).First();
            RuleGeneratorTemplate.MyHT["scn5_ind_dr_amt"] = curRule.dr_txn_amount;
            RuleGeneratorTemplate.MyHT["scn5_ind_dr_cnt"] = curRule.dr_trx_cnt;
            RuleGeneratorTemplate.MyHT["scn5_cust_risk_th"] = curRule.cust_risk;


            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 10).First();
            RuleGeneratorTemplate.MyHT["scn5_org_dr_amt"] = curRule.dr_txn_amount;
            RuleGeneratorTemplate.MyHT["scn5_org_dr_cnt"] = curRule.dr_trx_cnt;
            RuleGeneratorTemplate.MyHT["scn5_cust_risk_th2"] = curRule.cust_risk;

            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 11).First();
            RuleGeneratorTemplate.MyHT["scn5_ind_cr_amt"] = curRule.cr_trx_amt;
            RuleGeneratorTemplate.MyHT["scn5_ind_cr_cnt"] = curRule.cr_txn_cnt;
            RuleGeneratorTemplate.MyHT["scn5_cust_risk_th3"] = curRule.cust_risk;

            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 12).First();
            RuleGeneratorTemplate.MyHT["scn5_org_cr_amt"] = curRule.cr_trx_amt;
            RuleGeneratorTemplate.MyHT["scn5_org_cr_cnt"] = curRule.cr_txn_cnt;
            RuleGeneratorTemplate.MyHT["scn5_cust_risk_th4"] = curRule.cust_risk;
            //Rule 7
            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 13).First();
            RuleGeneratorTemplate.MyHT["scn7_ind_ftc_ind"] = 1;
            RuleGeneratorTemplate.MyHT["scn7_ind_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn7_cust_risk_th"] = curRule.cust_risk;

            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 14).First();
            RuleGeneratorTemplate.MyHT["scn7_org_ftc_ind"] = 1;
            RuleGeneratorTemplate.MyHT["scn7_org_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn7_cust_risk_th2"] = curRule.cust_risk;
            //Rule 8
            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 15).First();
            RuleGeneratorTemplate.MyHT["scn8_ind_trxn_cnt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn8_cust_risk_th"] = curRule.cust_risk;

            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 16).First();
            RuleGeneratorTemplate.MyHT["scn8_org_trxn_cnt"] = curRule.Tot_Trx_Count;
            RuleGeneratorTemplate.MyHT["scn8_cust_risk_th2"] = curRule.cust_risk;
            //Rule 9
            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 17).First();
            RuleGeneratorTemplate.MyHT["scn9_ind_cr_trxn_amt"] = curRule.cr_trx_amt;
            RuleGeneratorTemplate.MyHT["scn9_ind_cr_trxn_cnt"] = curRule.cr_txn_cnt;
            RuleGeneratorTemplate.MyHT["scn9_ind_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn9_ind_denom_ind"] = bool.TryParse(curRule.isDenom.ToString(), out var bDenom7) ? 1 : 0;
            RuleGeneratorTemplate.MyHT["scn9_cust_risk_th"] = curRule.cust_risk;

            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 18).First();
            RuleGeneratorTemplate.MyHT["scn9_org_cr_trxn_amt"] = curRule.cr_trx_amt;
            RuleGeneratorTemplate.MyHT["scn9_org_cr_trxn_cnt"] = curRule.cr_txn_cnt;
            RuleGeneratorTemplate.MyHT["scn9_org_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn9_org_denom_ind"] = bool.TryParse(curRule.isDenom.ToString(), out var bDenom8) ? 1 : 0;
            RuleGeneratorTemplate.MyHT["scn9_cust_risk_th2"] = curRule.cust_risk;
            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 19).First();
            RuleGeneratorTemplate.MyHT["scn9_ind_dr_trxn_amt"] = curRule.dr_txn_amount;
            RuleGeneratorTemplate.MyHT["scn9_ind_dr_trxn_cnt"] = curRule.dr_trx_cnt;
            RuleGeneratorTemplate.MyHT["scn9_ind_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn9_cust_risk_th3"] = curRule.cust_risk;
            curRule = susTxn.ScnList.Where(x => x.Rule_ID == 20).First();
            RuleGeneratorTemplate.MyHT["scn9_org_dr_trxn_amt"] = curRule.dr_txn_amount;
            RuleGeneratorTemplate.MyHT["scn9_org_dr_trxn_cnt"] = curRule.dr_trx_cnt;
            RuleGeneratorTemplate.MyHT["scn9_org_trxn_amt"] = curRule.Tot_Trx_Amount;
            RuleGeneratorTemplate.MyHT["scn9_cust_risk_th4"] = curRule.cust_risk;
        }

        /// <summary>
        /// Read Output File from Clips
        /// </summary>
        void ReadCsv()
        {
            // open the file "data.csv" which is a CSV file with headers
            //using (var csv = new CachedCsvReader(new StreamReader("C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv"), true))
            //{
            //    // Field headers will automatically be used as column names
            //    var x= csv;
            //   // dataGridViewRules.DataSource = csv;

            //    //dataGridViewRules.DataSourc
            //    //Console.WriteLine(x.ToArray());
            //}
            var yourData = File.ReadAllLines("C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv")
                   .Skip(1)
                   .Select(x => x.Split(','))
                   .Select(x => new
                   {
                       CustomerId = x[0],
                       TransactionId = x[1],
                       ScenarioId = int.Parse(x[2])
                   }).ToList();

            foreach (var x in yourData)
            {
                Console.WriteLine("Customerid {0} , Transaction Id {1}, Scenario Id {2}", x.CustomerId, x.TransactionId, x.ScenarioId);
            }

            //var report = from stxn in yourData
            //             join rule in susTxn.ScnList on stxn.ScenarioId equals rule.Rule_Short_Name 
            //             join txn in susTxn.TranList on stxn.TransactionId equals txn.Transaction_ID 
            //             join cust in susTxn.CustList on stxn.TransactionId equals cust.Customer_ID 
            //             where rule.Cust_Type==cust.Customer_type
            //             select new { cust.Customer_ID,cust.Account_number,cust.Customer_Risk,
            //                 txn.Transaction_Amount,txn.Transaction_date,txn.Transaction_Source,txn.Transaction_type,
            //             rule.Rule_ID,rule.Rule_Short_Name,rule.Rule_Description,rule.dr_trx_cnt,rule.dr_txn_amount,
            //             rule.cr_trx_amt,rule.cr_txn_cnt,rule.Tot_Trx_Amount,rule.Tot_Trx_Count,rule.isDenom,rule.ftc_ind};

            var report = from stxn in yourData
                         join rule in susTxn.ScnList on stxn.ScenarioId equals rule.Rule_ID
                         join txn in susTxn.TranList on stxn.TransactionId equals txn.Transaction_ID
                         select new
                         {
                             stxn.CustomerId,
                             stxn.TransactionId,
                             txn.Transaction_Amount,
                             txn.Transaction_date,
                             txn.Transaction_Source,
                             txn.Transaction_type,
                             rule.Rule_ID,
                             rule.Rule_Short_Name,
                             rule.Rule_Description,
                             rule.dr_trx_cnt,
                             rule.dr_txn_amount,
                             rule.cr_trx_amt,
                             rule.cr_txn_cnt,
                             rule.Tot_Trx_Amount,
                             rule.Tot_Trx_Count,
                             rule.isDenom,
                             rule.ftc_ind
                         };
            //Excel.ExcelUtlity obj = new Excel.ExcelUtlity();
            DataTable dt = ConvertToDataTable(report.ToList());
            //obj.WriteDataTableToExcel(dt, "Suspicious Transaction Recommender", "C:\\ISBARecoPrj\\ISBARecoPrj\\Final_Report.xlsx", "Details");
            dt.WriteToCsvFile("C:\\ISBARecoPrj\\ISBARecoPrj\\Final_Report.csv");
            MessageBox.Show("Excel created C:\\ISBARecoPrj\\ISBARecoPrj\\Final_Report.csv");
        }

        public DataTable ConvertToDataTable<T>(IList<T> data)
        {
            PropertyDescriptorCollection properties =
               TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            foreach (PropertyDescriptor prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
            foreach (T item in data)
            {
                DataRow row = table.NewRow();
                foreach (PropertyDescriptor prop in properties)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                table.Rows.Add(row);
            }
            return table;

        }

        /// <summary>
        /// Generate Facts for all the Customers having Transaction Data
        /// </summary>
        private void GenerateFacts()
        {
            //var query = susTxn.TranList.Join(
            //    susTxn.CustList,
            //    txn => txn.Account_ID,
            //    cust => cust.Customer_ID,
            //    (txn, cust) => new { Customer = cust, Trxn = txn })
            //    .Where(x => x.Customer.Customer_ID == x.Trxn.Account_ID)
            //    .Select(x => new { CustID= x.Customer.Customer_ID, CustType= x.Customer.Customer_type, x.Trxn }).ToList();

            var CustData = susTxn.CustList
                .Select(x => new FactsData
                {
                    CustID = x.Customer_ID,
                    CustType = x.Customer_type,
                    CustRisk = x.Customer_Risk
                }).ToList();

            foreach (var item in CustData)
            {
                if (!(item is null) )
                {
                    RuleGeneratorTemplate.MyHT.Clear();
                    RuleGeneratorTemplate.MyHT["CustID"] = item.CustID;
                    RuleGeneratorTemplate.MyHT["CustType"] = item.CustType;
                    RuleGeneratorTemplate.MyHT["CustRisk"] = item.CustRisk;
                    var txnList = susTxn.TranList.Where(y => y.Account_ID == item.CustID).ToList();

                    if(txnList.Count>0)
                    {
                        RuleGeneratorTemplate.MyHT["TxnList"] = txnList.Select(x => new
                        {
                            Transaction_ID = x.Transaction_ID,
                            Transaction_Amount = x.Transaction_Amount,
                            Bene_Name = x.Bene_Name,
                            Denomination = x.Denomination.HasValue ? 1 : 0,
                            Transaction_type = x.Transaction_type,
                            ftc_ind=x.Bene_Country
                        }).ToList();

                        GenerateRuleParams();

                        String s = RuleGeneratorTemplate.Run();

                        using (StreamWriter outputFile = new StreamWriter(@"C:\\ISBARecoPrj\\ISBARecoPrj\\facts_threshold.clp", false))
                        {
                            outputFile.Write(s);
                        }

                        LoadRules();
                    }                  
                }
                continue;
                
                //Console.WriteLine("Cust Name:{0},Cust type:{1} , Count:{2}", item.CustID,item.CustType
                //,item.TxnList.Count
                //  );
            }
        }
        /// <summary>
        /// Load and execute rules!
        /// </summary>
        private void LoadRules()
        {
            //string path = Directory.GetCurrentDirectory();
            //Console.Write(path);
            enviroment.Reset();
            enviroment.Clear();
            enviroment.Load("C:\\ISBARecoPrj\\ISBARecoPrj\\facts_threshold.clp");
            enviroment.Load("C:\\ISBARecoPrj\\ISBARecoPrj\\rule_report_gene.clp");
            enviroment.Reset();
            enviroment.Run();
        }
        #endregion

    }
 }

