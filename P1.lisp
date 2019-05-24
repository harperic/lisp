;; Let's get started in common lisp

;; some notes: in emacs with slime properly set up (this doesn't seem too
;; difficult), use Ret-m to bring up the "context specific" menu (major mode)
;; which then will let us launch slime with '. We can then load this file with
;; Ret-m-c-C and run in SLIME with (problem_1 1000)

;; problem 1: find the sum of all the multiples of 3 or 5 below 1000

;; note: I found this solution somewhere (I should make a note of where)
;; but I am I suppose attempting to learn CL using this solution

;; iterative
;; this feels pretty obvious
;; define a function
(defun problem_1 (num)
  ;; let will create variable bindings. it is a "double list" because let will
  ;; allow you to set any number of variables that you'd like, not just 1
  ;; here, we only set sum to be 0
  (let ((sum 0))
    ;; this seems fairly straightforward: loop for i from 1 to what should be
    ;; n-1, but note the strange way that's written
    ;; interesting 1+, 1- (note the lack of space) are succ, pred in haskell
    (loop for i from 1 to (1- num)
    ;; while this line delivers the same result (n - 1) it does it differently
    ;; (loop for i from 1 to (- num 1)
          ;; looks like this is similar to BASH in terms of needing a do
          ;; statement...
          ;; "Zero-P" returns 0 if true, otherwise returns false
          ;; I wonder why we don't use something like "=="?
          ;; mod is perfectly clear
          do (if (or (zerop (mod i 3))
                     (zerop (mod i 5)))
                 ;; increment the sum by i
                 (incf sum i)))
    ;; returns the value of sum
    sum))
;; recursive
;; again, define the function and arguments
(defun problem_1r (num)
  ;; labels will allow us to define a locally defined function, so a function
  ;; within this function...alright, I suppose that's easy enough
  ;; so "rec" is the function we are defining
  ;; and rec will take two args, n and sum
  ;; ah, rec means recursive...got it
  (labels ((rec (n sum)
             ;; if num is greater than n, just return the sum...
                (if (>= n num)
                    sum
                    ;; this is the else?
                    (if (or (zerop (mod n 3))
                            (zerop (mod n 5)))
                        ;; decide how to recurse
                        ;; compute on the next number
                        ;; and increment the sum by n
                        (rec (1+ n) (+ sum n))
                        ;; otherwise, compute on the next number
                        ;; but don't increment the sum
                        (rec (1+ n) sum)))))
           (rec 1 0)))

;; this is my solution to P1
;; and we can take advantage of the nice union operator in lisp
;; let's skip the locally defined function, I usually don't program
;; like that in python, so why start now?
;; this is a bit weird in terms of how the function is laid out
(defun range (stop &optional (start 0) (step 1))
  ;; stop: final number inclusive
  ;; start: starting number
  ;; step: what to increment by
  (loop for i from start to stop by step collect i))
;; Now this is more functional/haskell-like
(defun problem_1x (num)
  ;; there is a nice sum/reduce function built in
  ;; I don't understand why the + needs to be '+
  ;; my guess is that I need the operator + to be passed into
  ;; reduce, and by just having + there, it attempts to evaluate
  ;; using + rather than pass into the reduce function, or something
  (reduce '+ (union (range num 3 3) (range num 5 5))))
