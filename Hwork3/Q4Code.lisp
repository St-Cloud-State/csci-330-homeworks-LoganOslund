(defun insert-item (item sorted-list)
  (cond
   ((endp sorted-list) (list item))  ; If the sorted list is empty, return the item in a new list
   ((< item (car sorted-list)) (cons item sorted-list))  ; Insert item before the first element if smaller
   (t (cons (car sorted-list) (insert-item item (cdr sorted-list)))) ; Otherwise, insert recursively
  )
)  

(defun insertion-sort (unsorted-list)
  (if (endp unsorted-list)  ; If the unsorted list is empty, stop
      '()  ; An empty list is already sorted
      (let ((first-item (car unsorted-list))
            (rest-of-list (cdr unsorted-list)))
        (insert-item first-item (insertion-sort rest-of-list)) ; Insert the first item into the sorted list
      )
  )
)  


(let ((arr '(4 1 80 2 5)))
(format t "Original list: ~A~%" arr)
(format t "Sorted list: ~A~%" (insertion-sort arr))
)
