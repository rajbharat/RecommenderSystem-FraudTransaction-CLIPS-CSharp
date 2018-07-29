(deftemplate customer_trxn
(slot customer_id) (slot cust_type) (slot trxn_id) (slot total_trxn_amt) (slot benef_id) (slot ftc_ind) (slot denom) (slot cust_risk_ind) (slot dr_cr_ind))

(deffacts cust_trxn_dtl
(customer_trxn (customer_id 1) (cust_type ind) (dr_cr_ind dr) (trxn_id 10004) (total_trxn_amt 3000) (benef_id 20) (ftc_ind 0) (denom 0) (cust_risk_ind 6)) 
(customer_trxn (customer_id 1) (cust_type ind) (dr_cr_ind dr) (trxn_id 10000) (total_trxn_amt 3000) (benef_id 19) (ftc_ind 0) (denom 0) (cust_risk_ind 2)) 
(customer_trxn (customer_id 1) (cust_type ind) (dr_cr_ind cr) (trxn_id 10001) (total_trxn_amt 5000) (benef_id 23) (ftc_ind 1) (denom 1) (cust_risk_ind 10))
(customer_trxn (customer_id 1) (cust_type ind) (dr_cr_ind dr) (trxn_id 10002) (total_trxn_amt 15000) (benef_id 23) (ftc_ind 0) (denom 1) (cust_risk_ind 2))

;;threshold value for scenario 1
(scn1_ind_trxn_amt 1500)
(scn1_ind_trxn_cnt 5)
(scn1_ind_ftc_ind all)
(scn1_ind_denom_ind all)
(scn1_org_trxn_amt 1500)
(scn1_org_trxn_cnt 5)
(scn1_org_ftc_ind all)
(scn1_org_denom_ind all)

;;threshold value for scenario 2
(scn2_ind_trxn_amt 1000)
(scn2_ind_denom_ind 1)
(scn2_org_trxn_amt 1000)
(scn2_org_denom_ind 1)

;;threshold value for scenario 3
(scn3_ind_trxn_cnt 15)
(scn3_ind_trxn_amt 1500)
(scn3_ind_denom_ind 1)
(scn3_org_trxn_cnt 25)
(scn3_org_trxn_amt 15000)
(scn3_org_denom_ind 1)

;;threshold value for scenario 4
(scn4_ind_trxn_cnt 15)
(scn4_ind_trxn_amt 1500)
(scn4_ind_denom_ind 1)
(scn4_ind_dr_trxn_amt 500)
(scn4_ind_cr_trxn_amt 500)
(scn4_org_trxn_cnt 15)
(scn4_org_trxn_amt 1500)
(scn4_org_denom_ind 1)
(scn4_org_dr_trxn_amt 500)
(scn4_org_cr_trxn_amt 500)

;;threshold value for scenario 5
(scn5_ind_dr_amt 1500)
(scn5_ind_dr_cnt 15)
(scn5_org_dr_amt 1500)
(scn5_org_dr_cnt 15)
(scn5_ind_cr_amt 1500)
(scn5_ind_cr_cnt 15)
(scn5_org_cr_amt 1500)
(scn5_org_cr_cnt 15)

;;threshold value for scenario 6
(scn6_ind_dr_cr_amt 1500)
(scn6_org_dr_cr_amt 1500)

;;threshold value for scenario 7
(scn7_ind_ftc_ind 1)
(scn7_ind_trxn_amt 1500)
(scn7_org_ftc_ind 1)
(scn7_org_trxn_amt 1500)

;;threshold value for scenario 8
(scn8_ind_trxn_cnt 1000)
(scn8_org_trxn_cnt 2000)

;;threshold value for scenario 9
(scn9_ind_cr_trxn_amt 1000)
(scn9_ind_cr_trxn_cnt 15)
(scn9_ind_trxn_amt 1900)
(scn9_ind_denom_ind 1)
(scn9_org_cr_trxn_amt 1000)
(scn9_org_cr_trxn_cnt 15)
(scn9_org_trxn_amt 1900)
(scn9_org_denom_ind 1)
(scn9_ind_dr_trxn_amt 1000)
(scn9_ind_dr_trxn_cnt 15)
(scn9_org_dr_trxn_amt 1000)
(scn9_org_dr_trxn_cnt 15)
(scn9_org_trxn_amt 1900)
)
	