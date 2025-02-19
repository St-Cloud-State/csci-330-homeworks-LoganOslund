(defun sort-pair (a b)
  (if (< a b)
      (list a b)
      (list b a)
  )
)

(defun partition (L)
  (cond
    ((endp L) nil) ; Return nil if the list is empty
    ((endp (cdr L)) (list (list (car L)))) ; If only one element, return it as a pair with itself
    (t (cons (sort-pair (car L) (cadr L)) ; Sort the first two elements into a pair
             (partition (cddr L)))
    )
  )
) ; Recursively process the rest of the list

;; Example usage
(let ((arr '(3 1 4 2 5 0)))
  (format t "Original list: ~A~%" arr)
  (format t "Sorted pairs: ~A~%" (partition arr)))
