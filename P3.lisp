;; What is the largest prime factor of the number 600851475143 ?

;; define the number whose largest prime factor we need to find
(defvar *goal* 600851475143)

;; this is a found function that of course returns if prime
(defun primep (num)
  ;; test if n is prime. if composite, the second returned
  ;; value is the lowest factor
  (when (> num 1)
    ;; check up to the sqrt of the num
    (loop for i from 2 to (sqrt num)
          ;; this is the non-prime check
          when (= 0 (mod num i))
            ;; will return nil because it's not prime
            ;; will then return the lowest factor
            return (values nil i)
          ;; if it hasn't already exited, returns true
          finally (return t))))

;; found solution
(defun problem_3 ()
  ;; set the upper bound to be the square root of the goal
  ;; as the list of factors is symmetrical
  (let ((upper_bound (isqrt *goal*)))
    ;; now let's loop
    ;; check each
    (loop for i from 1 upto upper_bound;; collect i)))
          when (and (primep i) (zerop (mod *goal* i)))
            ;; return the maximum
            maximize i)))

;; my solution
;; now let's be very clever
;; the upper bound on this number is the sqrt of the goal
(defun problem_3x ()
  ;; as before, set the upper bound to be the square root of the goal
  (let ((upper_bound (isqrt *goal*)))
    ;; now let's loop; instead of going up, we go down
    ;; so that the first value we run into we know is correct
    (loop for i from upper_bound downto 1
          ;; altered the order-of-ops so that prime evaluation
          ;; IFF factor divides. Greatly increases speed
          when (and (zerop (mod *goal* i))
                    (primep i))
            return i)))
