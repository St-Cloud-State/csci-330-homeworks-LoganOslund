(defun sort-pair (a b)
  (if (< a b)
      (list a b)
      (list b a)
  )
)

(defun partition-pairs (L)
  (cond
    ((endp L) nil) ; Return nil if the list is empty
    ((endp (cdr L)) (list (list (car L)))) ; If only one element, return it as a pair with itself
    (t (cons (sort-pair (car L) (cadr L)) ; Sort the first two elements into a pair
             (partition-pairs (cddr L)))) ; Recursively process the rest of the list
  )
) 

(defun merge-sorted-lists (L1 L2)
  (cond
   ((endp L1) L2)  ; If L1 is empty, return L2
   ((endp L2) L1)  ; If L2 is empty, return L1
   ((< (car L1) (car L2)) (cons (car L1) (merge-sorted-lists (cdr L1) L2)))  ; Merge the first element of L1
   (t (cons (car L2) (merge-sorted-lists L1 (cdr L2))))))  ; Merge the first element of L2

(defun merge-pairs (L)
  (cond
    ((endp L) nil)  ; If the list is empty, return nil
    ((endp (cdr L)) (car L))  ; If there's only one pair left, return it
    (t (let ((first (car L))
             (second (cadr L)))
         (merge-pairs (cons (merge-sorted-lists first second) (cddr L))))) ; Recursively merge adjacent pairs
  )
) 

(defun bottom-up (L)
  (let ((sorted-pairs (partition-pairs L))) ; Partition the list into sorted pairs
    (merge-pairs sorted-pairs)) ; Merge the sorted pairs
)  

(let ((arr '(9 1 1 35 0 4)))
  (format t "Original list: ~A~%" arr)
  (format t "Sorted list: ~A~%" (bottom-up arr))
)
