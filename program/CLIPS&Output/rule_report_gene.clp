(defrule scn1_trxn_cnt_check_ind
    (scn1_ind_trxn_amt ?trxn_amt_th)
    (scn1_ind_trxn_cnt ?trxn_cnt_th)
    (trxn_tot_amt ?trxn_tot_amt)
    (trxn_tot_cnt ?trxn_tot_cnt)
    (customer_trxn (customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id))
    (test (> ?trxn_tot_cnt ?trxn_cnt_th)) 
    (test (eq ?cust_type ind))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    (scn1_risk high)
    =>
    (assert (scn1_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",1") crlf)
    (close data1)
    ;(printout t ?id " is individual category alerted in scnearion high count and high value transaction " crlf)
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
;    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
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
    (scn1_risk high)
    =>
    (assert (scn1_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",2") crlf)
    (close data1)
    ;(printout t ?id " is org category alerted in scnearion high count and high value transaction " crlf)
)


(defrule scn2_trxn_amt_dmn_check_ind
    (scn2_ind_trxn_amt ?trxn_amt_th)
    ;(scn1_ind_trxn_cnt ?trxn_cnt_th)
    (trxn_tot_amt ?trxn_tot_amt)
    (scn2_ind_denom_ind ?trxn_denom)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind))
    (test (eq ?denom_ind ?trxn_denom)) 
    (test (eq ?cust_type ind))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    (scn2_risk high)
    =>
    (assert (scn2_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",3") crlf)
    (close data1)
    ;(printout t ?id " is individual category alerted in low denomination and high value transaction " crlf)
)



(defrule scn2_trxn_amt_dmn_check_org
    (scn2_org_trxn_amt ?trxn_amt_th)
    ;(scn1_ind_trxn_cnt ?trxn_cnt_th)
    (scn2_org_denom_ind ?trxn_denom)
    (trxn_tot_amt ?trxn_tot_amt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind))
    (test (eq ?denom_ind ?trxn_denom)) 
    (test (eq ?cust_type org))
    (test (> ?trxn_tot_amt ?trxn_amt_th))
    (scn2_risk high)
    =>
    (assert (scn2_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",4") crlf)
    (close data1)
    ;(printout t ?id " is org category alerted in low denomination and high value transaction " crlf)
)



(defrule scn3_trxn_amt_cnt_dmn_check_ind
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
    (scn3_risk high)
    =>
    (assert (scn3_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",5") crlf)
    (close data1)
    ;(printout t ?id " is individual category alerted in hight count,low denomination and high value transaction " crlf)
)



(defrule scn3_trxn_amt_cnt_dmn_check_org
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
    (scn3_risk high)
    =>
    (assert (scn3_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",6") crlf)
    (close data1)
    ;(printout t ?id " is org category alerted in hight count,low denomination and high value transaction " crlf)
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
    (scn4_risk high)
    =>
    (assert (scn4_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",7") crlf)
    (close data1)
    ;(printout t ?id " is individual category alerted in hight dr / cr count and high value transaction " crlf)
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
    (scn4_risk high)
    =>
    (assert (scn4_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",8") crlf)
    (close data1)
    ;(printout t ?id " is individual category alerted in hight dr / cr count and high value transaction " crlf)
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
    (scn5_risk high)
    =>
    (assert (scn5_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",9") crlf)
    (close data1)
    ;(printout t ?id " is individual category alerted in hight dr amount and count " crlf)
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
    (scn5_risk high)
    =>
    (assert (scn5_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",10") crlf)
    (close data1)
    ;(printout t ?id " is individual category alerted in hight dr amount and count " crlf)
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
    (scn5_risk high)
    =>
    (assert (scn5_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",11") crlf)
    (close data1)
    ;(printout t ?id " is individual category alerted in hight dr amount and count " crlf)
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
    (scn5_risk high)
    =>
    (assert (scn5_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",12") crlf)
    (close data1)
    ;(printout t ?id " is individual category alerted in hight dr amount and count " crlf)
)



(defrule scn7_trxn_amt_ftc_check_ind
    (scn7_ind_trxn_amt ?dr_cr_amt_th)
    (scn7_ind_ftc_ind ?ftc_ind_th)
    (trxn_tot_amt ?tot_trxn_amt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (ftc_ind ?ftc_ind) (denom ?denom_ind) )
    (test (eq ?cust_type ind))
    (test (> ?ftc_ind ?ftc_ind_th))
    (test (> ?tot_trxn_amt ?dr_cr_amt_th))
    (scn7_risk high)
    =>
    (assert (scn7_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",13") crlf)
    (close data1)
    ;(printout t ?id " is individual category alerted in foreign transaction and high value transaction " crlf)
)


(defrule scn7_trxn_amt_ftc_check_org
    (scn7_org_trxn_amt ?dr_cr_amt_th)
    (scn7_org_ftc_ind ?ftc_ind_th)
    (trxn_tot_amt ?tot_trxn_amt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (ftc_ind ?ftc_ind) (denom ?denom_ind) )
    (test (eq ?cust_type org))
    (test (> ?ftc_ind ?ftc_ind_th))
    (test (> ?tot_trxn_amt ?dr_cr_amt_th))
    (scn7_risk high)
    =>
    (assert (scn7_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",14") crlf)
    (close data1)
    ;(printout t ?id " is org category alerted in foreign transaction and high value transaction " crlf)
)

(defrule scn8_trxn_cnt_ind
    (scn8_ind_trxn_cnt ?trxn_cnt_th)
    (trxn_tot_cnt ?trxn_tot_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?cust_type ind))
    (test (> ?trxn_tot_cnt ?trxn_cnt_th))
    (scn8_risk high)
    =>
    (assert (scn8_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",15") crlf)
    (close data1)
    ;(printout t ?id " is individual category alerted in very high count " crlf)
)

(defrule scn8_trxn_cnt_org
    (scn8_org_trxn_cnt ?trxn_cnt_th)
    (trxn_tot_cnt ?trxn_tot_cnt)
    (customer_trxn(customer_id ?id) (cust_type ?cust_type) (trxn_id ?trxn_id) (denom ?denom_ind) )
    (test (eq ?cust_type org))
    (test (> ?trxn_tot_cnt ?trxn_cnt_th))
    (scn8_risk high)
    =>
    (assert (scn8_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",16") crlf)
    (close data1)
    ;(printout t ?id " is individual category alerted in very high count " crlf)
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
    (scn9_risk high)
    =>
    (assert (scn9_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",17") crlf)
    (close data1)
    ;(printout t ?id " is ind category alerted in low denomination,credit/debit transaction, hight count and high value transaction " crlf)
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
    (scn9_risk high)
    =>
    (assert (scn9_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",18") crlf)
    (close data1)
    ;(printout t ?id " is org category alerted in low denomination,credit transaction, hight count and high value transaction " crlf)
)


(defrule scn9_trxn_amt_cnt_denom_dr_check_ind
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
    (scn9_risk high)
    =>
    (assert (scn9_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",19") crlf)
    (close data1)
    ;(printout t ?id " is ind category alerted in low denomination,debit transaction, hight count and high value transaction " crlf)
)

(defrule scn9_trxn_amt_cnt_denom_dr_check_org
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
    (scn9_risk high)
    =>
    (assert (scn9_raised 1))
    (open "C:\\ISBARecoPrj\\ISBARecoPrj\\data_output.csv" data1 "a")
      (printout data1 (str-cat ?id","?trxn_id",20") crlf)
    (close data1)
    ;(printout t ?id " is org category alerted in low denomination,debit transaction, hight count and high value transaction " crlf)
)


(defrule total_amt_cnt
 =>
    (bind ?count 0)
    (bind ?sum 0)
    (do-for-all-facts ((?f customer_trxn)) TRUE
        (bind ?count (+ ?count 1))
        (bind ?sum (+ ?sum ?f:total_trxn_amt))
    )
    (assert (trxn_tot_amt ?sum))
    (assert (trxn_tot_cnt ?count))
    ;(printout t ?sum " sum " ?count " count " crlf)
)

(defrule total_dr_amt_cnt
 =>
    (bind ?dcount 0)
    (bind ?dsum 0)
    (do-for-all-facts ((?f customer_trxn)) TRUE 
        (if (eq ?f:dr_cr_ind dr) then
            (bind ?dcount (+ ?dcount 1))
            (bind ?dsum (+ ?dsum ?f:total_trxn_amt)))
    )
    (assert (dr_trxn_amt ?dsum))
    (assert (dr_trxn_cnt ?dcount))
    ;(printout t ?dsum " dsum " ?dcount " dcount " crlf)
)

(defrule total_cr_amt_cnt
 =>
    (bind ?ccount 0)
    (bind ?csum 0)
    (do-for-all-facts ((?f customer_trxn)) TRUE 
        (if (eq ?f:dr_cr_ind cr) then
            (bind ?ccount (+ ?ccount 1))
            (bind ?csum (+ ?csum ?f:total_trxn_amt)))
    )
    (assert (cr_trxn_amt ?csum))
    (assert (cr_trxn_cnt ?ccount))
    ;(printout t ?csum " csum " ?ccount " ccount " crlf)
)

(defrule scn1_set_cust_risk_low
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn1_cust_risk_th ?scn1_cust_risk_th)
    (test (< ?cust_risk ?scn1_cust_risk_th))
    =>
    (assert (scn1_risk low))
)

(defrule scn1_set_cust_risk_high
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn1_cust_risk_th ?scn1_cust_risk_th)
    (test (>= ?cust_risk ?scn1_cust_risk_th))
    =>
    (assert (scn1_risk high))
)

(defrule scn1_set_cust_risk_low2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn1_cust_risk_th2 ?scn1_cust_risk_th2)
    (test (< ?cust_risk ?scn1_cust_risk_th2))
    =>
    (assert (scn1_risk low))
)

(defrule scn1_set_cust_risk_high2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn1_cust_risk_th2 ?scn1_cust_risk_th2)
    (test (>= ?cust_risk ?scn1_cust_risk_th2))
    =>
    (assert (scn1_risk high))
)

(defrule scn2_set_risk_low
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn2_cust_risk_th ?scn2_cust_risk_th)
    (test (< ?cust_risk ?scn2_cust_risk_th))
    =>
    (assert (scn2_risk low))
    )


(defrule scn2_set_risk_high
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn2_cust_risk_th ?scn2_cust_risk_th)
    (test (>= ?cust_risk ?scn2_cust_risk_th))
    =>
    (assert (scn2_risk high))
    )

(defrule scn2_set_risk_low2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn2_cust_risk_th2 ?scn2_cust_risk_th2)
    (test (< ?cust_risk ?scn2_cust_risk_th2))
    =>
    (assert (scn2_risk low))
    )


(defrule scn2_set_risk_high2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn2_cust_risk_th2 ?scn2_cust_risk_th2)
    (test (>= ?cust_risk ?scn2_cust_risk_th2))
    =>
    (assert (scn2_risk high))
    )
	
(defrule scn3_set_risk_low
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn3_cust_risk_th ?scn3_cust_risk_th)
    (test (< ?cust_risk ?scn3_cust_risk_th))
    =>
    (assert (scn3_risk low))
    )

(defrule scn3_set_risk_high
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn3_cust_risk_th ?scn3_cust_risk_th)
    (test (>= ?cust_risk ?scn3_cust_risk_th))
    =>
    (assert (scn3_risk high))
    )

(defrule scn3_set_risk_low2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn3_cust_risk_th2 ?scn3_cust_risk_th2)
    (test (< ?cust_risk ?scn3_cust_risk_th2))
    =>
    (assert (scn3_risk low))
    )

(defrule scn3_set_risk_high2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn3_cust_risk_th2 ?scn3_cust_risk_th2)
    (test (>= ?cust_risk ?scn3_cust_risk_th2))
    =>
    (assert (scn3_risk high))
    )
	
(defrule scn4_set_risk_low
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn4_cust_risk_th ?scn4_cust_risk_th)
    (test (< ?cust_risk ?scn4_cust_risk_th))
    =>
    (assert (scn4_risk low))
    )


(defrule scn4_set_risk_high
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn4_cust_risk_th ?scn4_cust_risk_th)
    (test (>= ?cust_risk ?scn4_cust_risk_th))
    =>
    (assert (scn4_risk high))
    )

(defrule scn4_set_risk_low2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn4_cust_risk_th2 ?scn4_cust_risk_th2)
    (test (< ?cust_risk ?scn4_cust_risk_th2))
    =>
    (assert (scn4_risk low))
    )


(defrule scn4_set_risk_high2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn4_cust_risk_th2 ?scn4_cust_risk_th2)
    (test (>= ?cust_risk ?scn4_cust_risk_th2))
    =>
    (assert (scn4_risk high))
    )
	
(defrule scn5_set_risk_low
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn5_cust_risk_th ?scn5_cust_risk_th)
    (test (< ?cust_risk ?scn5_cust_risk_th))
    =>
    (assert (scn5_risk low))
    )


(defrule scn5_set_risk_high
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn5_cust_risk_th ?scn5_cust_risk_th)
    (test (>= ?cust_risk ?scn5_cust_risk_th))
    =>
    (assert (scn5_risk high))
    )

(defrule scn5_set_risk_low2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn5_cust_risk_th2 ?scn5_cust_risk_th2)
    (test (< ?cust_risk ?scn5_cust_risk_th2))
    =>
    (assert (scn5_risk low))
    )


(defrule scn5_set_risk_high2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn5_cust_risk_th2 ?scn5_cust_risk_th2)
    (test (>= ?cust_risk ?scn5_cust_risk_th2))
    =>
    (assert (scn5_risk high))
    )

(defrule scn5_set_risk_low3
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn5_cust_risk_th3 ?scn5_cust_risk_th3)
    (test (< ?cust_risk ?scn5_cust_risk_th3))
    =>
    (assert (scn5_risk low))
    )


(defrule scn5_set_risk_high3
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn5_cust_risk_th3 ?scn5_cust_risk_th3)
    (test (>= ?cust_risk ?scn5_cust_risk_th3))
    =>
    (assert (scn5_risk high))
    )	

(defrule scn5_set_risk_low4
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn5_cust_risk_th4 ?scn5_cust_risk_th4)
    (test (< ?cust_risk ?scn5_cust_risk_th4))
    =>
    (assert (scn5_risk low))
    )


(defrule scn5_set_risk_high4
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn5_cust_risk_th4 ?scn5_cust_risk_th4)
    (test (>= ?cust_risk ?scn5_cust_risk_th4))
    =>
    (assert (scn5_risk high))
    )
	
(defrule scn7_set_risk_low
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn7_cust_risk_th ?scn7_cust_risk_th)
    (test (< ?cust_risk ?scn7_cust_risk_th))
    =>
    (assert (scn7_risk low))
    )


(defrule scn7_set_risk_high
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn7_cust_risk_th ?scn7_cust_risk_th)
    (test (>= ?cust_risk ?scn7_cust_risk_th))
    =>
    (assert (scn7_risk high))
    )

(defrule scn7_set_risk_low2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn7_cust_risk_th2 ?scn7_cust_risk_th2)
    (test (< ?cust_risk ?scn7_cust_risk_th2))
    =>
    (assert (scn7_risk low))
    )


(defrule scn7_set_risk_high2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn7_cust_risk_th2 ?scn7_cust_risk_th2)
    (test (>= ?cust_risk ?scn7_cust_risk_th2))
    =>
    (assert (scn7_risk high))
    )
	
(defrule scn8_set_risk_low
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn8_cust_risk_th ?scn8_cust_risk_th)
    (test (< ?cust_risk ?scn8_cust_risk_th))
    =>
    (assert (scn8_risk low))
    )


(defrule scn8_set_risk_high
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn8_cust_risk_th ?scn8_cust_risk_th)
    (test (>= ?cust_risk ?scn8_cust_risk_th))
    =>
    (assert (scn8_risk high))
    )

(defrule scn8_set_risk_low2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn8_cust_risk_th2 ?scn8_cust_risk_th2)
    (test (< ?cust_risk ?scn8_cust_risk_th2))
    =>
    (assert (scn8_risk low))
    )


(defrule scn8_set_risk_high2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn8_cust_risk_th2 ?scn8_cust_risk_th2)
    (test (>= ?cust_risk ?scn8_cust_risk_th2))
    =>
    (assert (scn8_risk high))
    )

(defrule scn9_set_risk_low
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn9_cust_risk_th ?scn9_cust_risk_th)
    (test (< ?cust_risk ?scn9_cust_risk_th))
    =>
    (assert (scn9_risk low))
    )

(defrule scn9_set_risk_high
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn9_cust_risk_th ?scn9_cust_risk_th)
    (test (>= ?cust_risk ?scn9_cust_risk_th))
    =>
    (assert (scn9_risk high))
    )

(defrule scn9_set_risk_low2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn9_cust_risk_th2 ?scn9_cust_risk_th2)
    (test (< ?cust_risk ?scn9_cust_risk_th2))
    =>
    (assert (scn9_risk low))
    )

(defrule scn9_set_risk_high2
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn9_cust_risk_th2 ?scn9_cust_risk_th2)
    (test (>= ?cust_risk ?scn9_cust_risk_th2))
    =>
    (assert (scn9_risk high))
    )

(defrule scn9_set_risk_low3
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn9_cust_risk_th3 ?scn9_cust_risk_th3)
    (test (< ?cust_risk ?scn9_cust_risk_th3))
    =>
    (assert (scn9_risk low))
    )

(defrule scn9_set_risk_high3
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn9_cust_risk_th3 ?scn9_cust_risk_th3)
    (test (>= ?cust_risk ?scn9_cust_risk_th3))
    =>
    (assert (scn9_risk high))
    )

(defrule scn9_set_risk_low4
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn9_cust_risk_th4 ?scn9_cust_risk_th4)
    (test (< ?cust_risk ?scn9_cust_risk_th4))
    =>
    (assert (scn9_risk low))
    )

(defrule scn9_set_risk_high4
    (customer_trxn(customer_id ?id) (cust_risk ?cust_risk))
    (scn9_cust_risk_th4 ?scn9_cust_risk_th4)
    (test (>= ?cust_risk ?scn9_cust_risk_th4))
    =>
    (assert (scn9_risk high))
    )