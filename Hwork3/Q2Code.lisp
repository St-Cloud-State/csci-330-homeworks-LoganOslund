(defun PARTITION (L)
  (if (endp L) ; if empty,
      '(nil nil) ; return empty lists
    (let ((X (PARTITION (cdr L))))
      (list  (cons (car L)(cadr X)) (car X) ) ; create a pair of lists
    )
   )
) 

(defun MERGE-LISTS (L1 L2)
  (cond
   ((and(endp L1 )(endp L2)) nil ) ; both empty, return empty
   ((endp L1) (cons (CAR L2) (MERGE-LISTS nil (CDR L2)))) ; L1 empty, return L2
   ((endp L2) (cons (CAR L1) (MERGE-LISTS (CDR L1) NIL))) ; L2 empty, return L1
   ((< (CAR L1) (CAR L2)) (cons (CAR L1) (MERGE-LISTS (CDR L1) L2  )))  ; if L1 smaller than 2, add L1 to final list
   ((>= (CAR L1) (CAR L2)) (cons (CAR L2) (MERGE-LISTS L1 (CDR L2))  )) ; if L1 bigger or equal, add L2 to final list
  )
)

(defun MERSORT (L)
  (cond ((endp L) nil)
        ((endp (cdr L)) L)
        (t
        (let* ((S (PARTITION L ))
                (L1 (car S))
                (L2 (cadr S))
                (X (MERSORT L1))
                (Y (MERSORT L2)))
           (MERGE-LISTS X Y)
        )
        )
    )
)

(let ((arr '(6 9 3 5 0 34 71 1 3 2)))  ; Define arr
(format t "Original list: ~A~%" arr) ; print og array
(format t "Sorted list: ~A~%" (MERSORT arr))) ; print sorted array