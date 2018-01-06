(in-package :cl-user)

(defpackage clkanrc-ch01.03-test.temperature-conversion
  (:use :cl
        :clkanrc-ch01.03.temperature-conversion
        :check-it
        :prove))
(in-package :clkanrc-ch01.03-test.temperature-conversion)

(plan 3)

(defconstant +epsilon+ 1e-5)

(defconstant +test-cases+
  (list
   '(0.0 32.0)
   (list (/ 5.0 9.0) 33.0)
   '(5.0 41.0)
   '(-5.0 23.0)
   '(10.0 50.0)
   '(15.0 59.0)
   '(35.0 95.0)))

(defun approximately-eql (actual expected)
  (< (abs (- actual expected)) +epsilon+))

(defmacro def-conversion-test (name sut input-name expected-name)
  `(subtest ,name
     (mapcar
      (lambda (pair)
        (let ((celsius (first pair)) (fahrenheit (second pair)))
          (is (,sut ,input-name)
              ,expected-name
              (format nil "Converting ~a ~a should produce ~a" ,input-name ,name ,expected-name)
              :test #'approximately-eql)))
      +test-cases+)))

(def-conversion-test "Celsius to Fahrenheit" celsius->fahrenheit celsius fahrenheit)
(def-conversion-test "Fahrenheit to Celsius" fahrenheit->celsius fahrenheit celsius)

(subtest "Check-it tests"
  (let ((*num-trials* 100))
    (ok (check-it (generator (real))
                  (lambda (x) (approximately-eql
                               x (celsius->fahrenheit
                                  (fahrenheit->celsius
                                   x)))))
        "Converting 100 random numbers from celsius to fahrenheit and back, gave the original value within 1e-5.")))

(finalize)
