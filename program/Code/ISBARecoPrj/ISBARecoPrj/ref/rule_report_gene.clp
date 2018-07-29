(defrule scn1_trxn_cnt_check_ind
    (scn1_ind_trxn_amt ?trxn_amt_th)
    (scn1_ind_trxn_cnt ?trxn_cnt_th)
    (trxn_tot_amt ?trxn_tot_amt)
    (trxn_tot_cnt ?trxn_tot_cnt)
    (customer_trxn (customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id))
    (test (> ?trxn_tot_cnt ?trxn_cnt_th)) 
    (test (eq ?cust_type ind))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    =>
    ;(assert (scn1_ind_cnt_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO1") crlf)
    (close data1)
    (printout t ?id " is individual category alerted in scnearion high count and high value transaction " crlf)
)


;(defrule scn1_trxn_amt_check
;    (scn1_ind_trxn_amt ?trxn_amt_th)
;    (customer_trxn(customer_id ?id) (total_trxn_amt ?trxn_amt) (trxn_id ?trxn_id))
;    ?chk-sol <- (scn1_ind_cnt_chck ?newv) 
;    (scn1_ind_cnt_chck yes)
;    (test (> ?trxn_amt ?trxn_amt_th))
;    =>
;    ;(assert (scn1_trxn_amt_check yes))
;    (retract ?chk-sol)
;    (open "data_output.dat" data1 "a")
;    (printout data1 (str-cat ?id " is alerted in scnearion high count and high value transaction") crlf)
;    (close data1)
;)


(defrule scn1_trxn_cnt_check_org
    (scn1_org_trxn_amt ?trxn_amt_th)
    (scn1_org_trxn_cnt ?trxn_cnt_th)
    (trxn_tot_amt ?trxn_tot_amt)
    (trxn_tot_cnt ?trxn_tot_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id))
    (test (> ?trxn_tot_cnt ?trxn_cnt_th)) 
    (test (eq ?cust_type org))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    =>
    ;(assert (scn1_org_cnt_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO1") crlf)
    (close data1)
    (printout t ?id " is org category alerted in scnearion high count and high value transaction " crlf)
)


(defrule scn1_trxn_amt_dmn_check_ind
    (scn2_ind_trxn_amt ?trxn_amt_th)
    ;(scn1_ind_trxn_cnt ?trxn_cnt_th)
    (trxn_tot_amt ?trxn_tot_amt)
    (scn2_ind_denom_ind ?trxn_denom)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind))
    (test (eq ?denom_ind ?trxn_denom)) 
    (test (eq ?cust_type ind))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO2") crlf)
    (close data1)
    (printout t ?id " is individual category alerted in low denomination and high value transaction " crlf)
)



(defrule scn1_trxn_amt_dmn_check_org
    (scn2_org_trxn_amt ?trxn_amt_th)
    ;(scn1_ind_trxn_cnt ?trxn_cnt_th)
    (scn2_org_denom_ind ?trxn_denom)
    (trxn_tot_amt ?trxn_tot_amt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind))
    (test (eq ?denom_ind ?trxn_denom)) 
    (test (eq ?cust_type org))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO2") crlf)
    (close data1)
    (printout t ?id " is org category alerted in low denomination and high value transaction " crlf)
)



(defrule scn1_trxn_amt_cnt_dmn_check_ind
    (scn3_ind_trxn_amt ?trxn_amt_th)
    (scn3_ind_trxn_cnt ?trxn_cnt_th)
    (scn3_ind_denom_ind ?trxn_denom_th)
    (trxn_tot_amt ?trxn_tot_amt)
    (trxn_tot_cnt ?trxn_tot_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind))
    (test (eq ?denom_ind ?trxn_denom_th)) 
    (test (eq ?cust_type ind))
    (test (> ?trxn_tot_cnt ?trxn_cnt_th))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO3") crlf)
    (close data1)
    (printout t ?id " is individual category alerted in hight count,low denomination and high value transaction " crlf)
)



(defrule scn1_trxn_amt_cnt_dmn_check_org
    (scn3_org_trxn_amt ?trxn_amt_th)
    (scn3_org_trxn_cnt ?trxn_cnt_th)
    (scn3_org_denom_ind ?trxn_denom_th)
    (trxn_tot_amt ?trxn_tot_amt)
    (trxn_tot_cnt ?trxn_tot_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?denom_ind ?trxn_denom_th)) 
    (test (eq ?cust_type org))
    (test (> ?trxn_tot_cnt ?trxn_cnt_th))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO3") crlf)
    (close data1)
    (printout t ?id " is org category alerted in hight count,low denomination and high value transaction " crlf)
)

(defrule scn4_trxn_amt_cnt_drcr_check_ind
    (scn4_ind_dr_trxn_amt ?dr_amt_th)
    (scn4_ind_cr_trxn_amt ?cr_amt_th)
    (scn4_ind_trxn_amt ?trxn_amt_th)
    (scn4_ind_trxn_cnt ?trxn_cnt_th)
    (dr_trxn_amt ?dr_trxn_amt)
    (cr_trxn_amt ?cr_trxn_amt)
    (trxn_tot_amt ?trxn_tot_amt)
    (trxn_tot_cnt ?trxn_tot_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?cust_type ind))
    (test (> ?trxn_tot_cnt ?trxn_cnt_th))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    (test (> ?dr_trxn_amt ?dr_amt_th))
    (test (> ?cr_trxn_amt ?cr_amt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO4") crlf)
    (close data1)
    (printout t ?id " is individual category alerted in hight dr / cr count and high value transaction " crlf)
)

(defrule scn4_trxn_amt_cnt_drcr_check_org
    (scn4_org_dr_trxn_amt ?dr_amt_th)
    (scn4_org_cr_trxn_amt ?cr_amt_th)
    (scn4_org_trxn_amt ?trxn_amt_th)
    (scn4_org_trxn_cnt ?trxn_cnt_th)
    (dr_trxn_amt ?dr_trxn_amt)
    (cr_trxn_amt ?cr_trxn_amt)
    (trxn_tot_amt ?trxn_tot_amt)
    (trxn_tot_cnt ?trxn_tot_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?cust_type org))
    (test (> ?trxn_tot_cnt ?trxn_cnt_th))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    (test (> ?dr_trxn_amt ?dr_amt_th))
    (test (> ?cr_trxn_amt ?cr_amt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO4") crlf)
    (close data1)
    (printout t ?id " is individual category alerted in hight dr / cr count and high value transaction " crlf)
)

(defrule scn5_trxn_amt_cnt_dr_check_ind
    (scn5_ind_dr_amt ?dr_amt_th)
    (scn5_ind_dr_cnt ?dr_cnt_th)
    (dr_trxn_amt ?dr_trxn_amt)
    (dr_trxn_cnt ?dr_trxn_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?cust_type ind))
    (test (> ?dr_trxn_amt ?dr_amt_th))
    (test (> ?dr_trxn_cnt ?dr_cnt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO5") crlf)
    (close data1)
    (printout t ?id " is individual category alerted in hight dr amount and count " crlf)
)

(defrule scn5_trxn_amt_cnt_dr_check_org
    (scn5_org_dr_amt ?dr_amt_th)
    (scn5_org_dr_cnt ?dr_cnt_th)
    (dr_trxn_amt ?dr_trxn_amt)
    (dr_trxn_cnt ?dr_trxn_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?cust_type org))
    (test (> ?dr_trxn_amt ?dr_amt_th))
    (test (> ?dr_trxn_cnt ?dr_cnt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO5") crlf)
    (close data1)
    (printout t ?id " is individual category alerted in hight dr amount and count " crlf)
)

(defrule scn5_trxn_amt_cnt_cr_check_ind
    (scn5_ind_cr_amt ?cr_amt_th)
    (scn5_ind_cr_cnt ?cr_cnt_th)
    (cr_trxn_amt ?cr_trxn_amt)
    (cr_trxn_cnt ?cr_trxn_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?cust_type ind))
    (test (> ?cr_trxn_amt ?cr_amt_th))
    (test (> ?cr_trxn_cnt ?cr_cnt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO5") crlf)
    (close data1)
    (printout t ?id " is individual category alerted in hight dr amount and count " crlf)
)

(defrule scn5_trxn_amt_cnt_cr_check_org
    (scn5_ind_cr_amt ?cr_amt_th)
    (scn5_ind_cr_cnt ?cr_cnt_th)
    (cr_trxn_amt ?cr_trxn_amt)
    (cr_trxn_cnt ?cr_trxn_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?cust_type org))
    (test (> ?cr_trxn_amt ?cr_amt_th))
    (test (> ?cr_trxn_cnt ?cr_cnt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO5") crlf)
    (close data1)
    (printout t ?id " is individual category alerted in hight dr amount and count " crlf)
)





(defrule scn1_trxn_amt_ftc_check_ind
    (scn7_ind_trxn_amt ?dr_cr_amt_th)
    (scn7_ind_ftc_ind ?ftc_ind_th)
    (trxn_tot_amt ?tot_trxn_amt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (ftc_ind ?ftc_ind) (denom ?denom_ind) )
    (test (eq ?cust_type ind))
    (test (> ?ftc_ind ?ftc_ind_th))
    (test (> ?tot_trxn_amt ?dr_cr_amt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO7") crlf)
    (close data1)
    (printout t ?id " is individual category alerted in foreign transaction and high value transaction " crlf)
)


(defrule scn1_trxn_amt_ftc_check_org
    (scn7_org_trxn_amt ?dr_cr_amt_th)
    (scn7_org_ftc_ind ?ftc_ind_th)
    (trxn_tot_amt ?tot_trxn_amt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (ftc_ind ?ftc_ind) (denom ?denom_ind) )
    (test (eq ?cust_type org))
    (test (> ?ftc_ind ?ftc_ind_th))
    (test (> ?tot_trxn_amt ?dr_cr_amt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO7") crlf)
    (close data1)
    (printout t ?id " is org category alerted in foreign transaction and high value transaction " crlf)
)

(defrule scn8_trxn_cnt_ind
    (scn8_ind_trxn_cnt ?trxn_cnt_th)
    (trxn_tot_cnt ?trxn_tot_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?cust_type ind))
    (test (> ?trxn_tot_cnt ?trxn_cnt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO8") crlf)
    (close data1)
    (printout t ?id " is individual category alerted in very high count " crlf)
)

(defrule scn8_trxn_cnt_org
    (scn8_org_trxn_cnt ?trxn_cnt_th)
    (trxn_tot_cnt ?trxn_tot_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?cust_type org))
    (test (> ?trxn_tot_cnt ?trxn_cnt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO8") crlf)
    (close data1)
    (printout t ?id " is individual category alerted in very high count " crlf)
)

(defrule scn9_trxn_amt_cnt_denom_cr_check_ind
    (scn9_ind_cr_trxn_amt ?cr_trxn_amt_th)
    (scn9_ind_cr_trxn_cnt ?trxn_cnt_th)
    (scn9_ind_denom_ind ?trxn_denom)
    (scn9_ind_trxn_amt ?trxn_amt_th)
    (cr_trxn_amt ?cr_trxn_amt)
    (cr_trxn_cnt ?cr_trxn_cnt)
    (trxn_tot_amt ?trxn_tot_amt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?denom_ind ?trxn_denom)) 
    (test (eq ?cust_type ind))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    (test (> ?cr_trxn_amt ?cr_trxn_amt_th))
    (test (> ?cr_trxn_cnt ?trxn_cnt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO9") crlf)
    (close data1)
    (printout t ?id " is ind category alerted in low denomination,credit/debit transaction, hight count and high value transaction " crlf)
)

(defrule scn9_trxn_amt_cnt_denom_cr_check_org
    (scn9_org_cr_trxn_amt ?cr_trxn_amt_th)
    (scn9_org_cr_trxn_cnt ?trxn_cnt_th)
    (scn9_org_denom_ind ?trxn_denom)
    (scn9_org_trxn_amt ?trxn_amt_th)
    (cr_trxn_amt ?cr_trxn_amt)
    (cr_trxn_cnt ?cr_trxn_cnt)
    (trxn_tot_amt ?trxn_tot_amt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?denom_ind ?trxn_denom)) 
    (test (eq ?cust_type org))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    (test (> ?cr_trxn_amt ?cr_trxn_amt_th))
    (test (> ?cr_trxn_cnt ?trxn_cnt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO9") crlf)
    (close data1)
    (printout t ?id " is org category alerted in low denomination,credit transaction, hight count and high value transaction " crlf)
)


(defrule scn1_trxn_amt_cnt_denom_dr_check_ind
    (scn10_ind_dr_trxn_amt ?dr_trxn_amt_th)
    (scn10_ind_dr_trxn_cnt ?trxn_cnt_th)
    (scn10_ind_denom_ind ?trxn_denom)
    (scn10_ind_trxn_amt ?trxn_amt_th)
    (dr_trxn_amt ?dr_trxn_amt)
    (dr_trxn_cnt ?dr_trxn_cnt)
    (trxn_tot_amt ?trxn_tot_amt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?denom_ind ?trxn_denom)) 
    (test (eq ?cust_type ind))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    (test (> ?dr_trxn_amt ?dr_trxn_amt_th))
    (test (> ?dr_trxn_cnt ?trxn_cnt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO9") crlf)
    (close data1)
    (printout t ?id " is ind category alerted in low denomination,debit transaction, hight count and high value transaction " crlf)
)

(defrule scn1_trxn_amt_cnt_denom_dr_check_org
    (scn10_org_dr_trxn_amt ?dr_trxn_amt_th)
    (scn10_org_dr_trxn_cnt ?trxn_cnt_th)
    (scn10_org_denom_ind ?trxn_denom)
    (scn10_org_trxn_amt ?trxn_amt_th)
    (dr_trxn_amt ?dr_trxn_amt)
    (dr_trxn_cnt ?dr_trxn_cnt)
    (trxn_tot_amt ?trxn_tot_amt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?denom_ind ?trxn_denom)) 
    (test (eq ?cust_type ind))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    (test (> ?dr_trxn_amt ?dr_trxn_amt_th))
    (test (> ?dr_trxn_cnt ?trxn_cnt_th))
    =>
    ;(assert (scn1_ind_den_chck no))
    (open "data_output.dat" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",SCENARIO9") crlf)
    (close data1)
    (printout t ?id " is org category alerted in low denomination,debit transaction, hight count and high value transaction " crlf)
)