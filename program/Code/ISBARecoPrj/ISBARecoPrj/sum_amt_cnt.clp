;(deftemplate customer_trxn
;    (slot trxn_id) (slot customer_id) (slot cust_type) (slot total_trxn_amt) (slot dr_cr_ind) (slot tot_trxn_cnt) (slot benef_id) (slot ftc_ind) (slot denom) (slot cust_risk_ind) (slot trxn_nbr)
;)
;(deffacts customer_trxn
;    (person (trxn_id 10001) (customer_id 1_1) (cust_type ind)  (total_trxn_amt 300) (dr_cr_ind dr) (tot_trxn_cnt 15) (benef_id 23) (ftc_ind 1) (denom no) (cust_risk_ind 6) (trxn_nbr 1)) 
;    (person (trxn_id 10002) (customer_id 1_2) (cust_type org)  (total_trxn_amt 300) (dr_cr_ind cr) (tot_trxn_cnt 15) (benef_id 23) (ftc_ind 1) (denom no) (cust_risk_ind 10) (trxn_nbr 1))
;    (person (trxn_id 10003) (customer_id 1_3) (cust_type ind)  (total_trxn_amt 300) (dr_cr_ind dr) (tot_trxn_cnt 15) (benef_id 23) (ftc_ind 1) (denom no) (cust_risk_ind 2) (trxn_nbr 1))
;    (person (trxn_id 10004) (customer_id 1_4) (cust_type org)  (total_trxn_amt 600) (dr_cr_ind cr) (tot_trxn_cnt 15) (benef_id 23) (ftc_ind 1) (denom no) (cust_risk_ind 10) (trxn_nbr 1))
;    (person (trxn_id 10005) (customer_id 1_5) (cust_type ind)  (total_trxn_amt 400) (dr_cr_ind cr) (tot_trxn_cnt 15) (benef_id 23) (ftc_ind 1) (denom no) (cust_risk_ind 2) (trxn_nbr 1))
;    ;;threshold value for scenario 1
;    (trxn_tot_amt 0)
;    (trxn_tot_amt 0)
;    (tot_dr_cnt 0)
;    (tot_dr_sum 0)
;    (tot_cr_cnt 0)
;    (tot_cr_sum 0)
;)


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
    (bind ?ccount 0)
    (bind ?csum 0)
    (do-for-all-facts ((?f customer_trxn)) TRUE 
        (if (eq ?f:dr_cr_ind dr) then
            (bind ?dcount (+ ?dcount 1))
            (bind ?dsum (+ ?dsum ?f:total_trxn_amt)))
        (if (eq ?f:dr_cr_ind cr) then
            (bind ?ccount (+ ?ccount 1))
            (bind ?csum (+ ?csum ?f:total_trxn_amt)))
    )
    (assert (dr_trxn_amt ?dsum))
    (assert (dr_trxn_cnt ?dcount))
    (assert (cr_trxn_amt ?csum))
    (assert (cr_trxn_cnt ?ccount))
    ;(printout t ?dsum " dsum " ?dcount " dcount " crlf)
)

;(defrule sum-amount 
;    (declare (salience 40)) 
;    (customer_trxn (trxn_id ?trxn_id) (customer_id ?id)  (total_trxn_amt ?trxn_amt) (dr_cr_ind ?dr) (tot_trxn_cnt ?trxn_cnt))
;    =>
;    (printout t ?trxn_amt " amount of current transaction " crlf)
;    (assert (add-to-sum ?trxn_amt))
;)
;
;(defrule sum-dr-amount 
;    (declare (salience 40)) 
;    (customer_trxn (customer_id ?id) (trxn_id ?trxn_id) (total_trxn_amt ?trxn_amt) (dr_cr_ind ?dr) (tot_trxn_cnt ?trxn_cnt))
;    (test (eq ?dr dr))
;    =>
;    (assert (dr_trxn_amt ?trxn_amt))
;)

;(defrule sum-cr-amount 
;    (declare (salience 40)) 
;    (customer_trxn (customer_id ?id) (trxn_id ?trxn_id) (total_trxn_amt ?trxn_amt) (dr_cr_ind ?dr) (tot_trxn_cnt ?trxn_cnt))
;    (test (eq ?dr cr))
;    =>
;    (assert (cr_trxn_amt ?trxn_amt))
;)
;
;(defrule sum-count-amount
;    (declare (salience 30))
;    ?sum-adr <- (tot_amt ?total) 
;    ?new-trxn-sum-adr <- (add-to-sum ?trxn_sum) 
;    ?count-adr <- (tot_cnt ?counter)
;    =>
;    (retract ?sum-adr ?new-trxn-sum-adr ?count-adr)
;    (printout t ?trxn_sum " total amount " ?total crlf)
;    (assert (tot_amt = (+ ?total ?trxn_sum)))
;    (assert (tot_cnt = (+ ?counter 1)))
;)
;
;(defrule sum-dr-amt
;    (declare (salience 20))
;    ?dr-amt-addr <- (tot_dr_sum ?tot_dr_amt)
;    ?new-dr-amt-adr <- (dr_trxn_amt ?dr_amt)
;    ?dr-count-adr <- (tot_dr_cnt ?drcounter)
;    =>
;    (retract ?dr-amt-addr ?new-dr-amt-adr ?dr-count-adr)
;    (assert (tot_dr_sum = (+ ?tot_dr_amt ?dr_amt)))
;    (assert (tot_dr_cnt = (+ ?drcounter 1)))
;)
;
;(defrule sum-cr-amt
;    (declare (salience 10))
;    ?cr-amt-addr <- (tot_cr_sum ?tot_cr_amt)
;    ?new-cr-amt-adr <- (cr_trxn_amt ?cr_amt)
;    ?cr-count-adr <- (tot_cr_cnt ?crcounter)
;    =>
;    (retract ?cr-amt-addr ?new-cr-amt-adr ?cr-count-adr)
;    (assert (tot_cr_sum = (+ ?tot_cr_amt ?cr_amt)))
;    (assert (tot_cr_cnt = (+ ?crcounter 1)))
;)