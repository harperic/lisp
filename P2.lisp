;; find the sum of even fibonacci numbers less than 4e6
;; we'll have the user supply the number (4 million)

;; this is a nice little clever solution here

(defun problem_2 (num)
  ;; first, we actually start with the second fib number
  ;; because we know the first two numbers are odd and
  ;; thus do not contribute
  ;; and we loop until b is our number
  (loop with a = 1 and b = 2 until (> b num)
        ;; we add to our sum every even b
        ;; btw what is the difference between when and if?
        ;; According to stack overflow, we use the when here
        ;; because the do statement will be executed regardless
        ;; I'm also sure there's another way to do this
        when (evenp b) sum b
          ;; this is nice as well because we don't ever create a list
          ;; and simply shift the value of b into a, and + a b to b
          do (shiftf a b (+ a b))))
