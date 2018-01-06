(in-package :cl-user)

(defpackage clkanrc-ch01.03.temperature-conversion
  (:use :cl)
  (:export :celsius->fahrenheit
           :fahrenheit->celsius))

(in-package :clkanrc-ch01.03.temperature-conversion)

(defconstant +zero-celsius-in-fahrenheit+ 32.0)

(defconstant +celsius-to-fahrenheit-ratio+ 5/9)

(defun celsius->fahrenheit (celsius)
  (+ +zero-celsius-in-fahrenheit+ (/ celsius +celsius-to-fahrenheit-ratio+)))

(defun fahrenheit->celsius (fahrenheit)
  (* +celsius-to-fahrenheit-ratio+ (- fahrenheit +zero-celsius-in-fahrenheit+)))
