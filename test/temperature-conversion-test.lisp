(in-package :cl-user)

(defpackage clkanrc-ch01.03-test.temperature-conversion
  (:use :cl
        :clkanrc-ch01.03.temperature-conversion
        :prove))
(in-package :clkanrc-ch01.03-test.temperature-conversion)

(plan 1)

(defconstant +celsius-to-fahrenheit-cases+
  (list
   '(0.0 32.0)
   (list (/ 5 9) 33.0)
   '(5.0 41.0)
   '(-5.0 23.0)
   '(10.0 50.0)
   '(15.0 59.0)
   '(35.0 95.0)))

(subtest "Celsius to Fahrenheit conversion"
  (mapcar (lambda (pair) (is (celsius->fahrenheit (first pair)) (second pair))) +celsius-to-fahrenheit-cases+))


(finalize)
