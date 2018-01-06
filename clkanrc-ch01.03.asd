(asdf:defsystem "clkanrc-ch01.03"
  :version      "0.1.0"
  :description  "A solution to the exercises 1.03 and 1.04 in common lisp."
  :author       "Bas Bossink <bas.bossink@gmail.com>"
  :maintainer   "Bas Bossink <bas.bossink@gmail.com>"
  :homepage     "https://github.com/basbossink/clkanrc-ch01.03"
  :serial       t
  :license      "Simplified 2-clause BSD"
  :components   ((:module "src"
                          :serial t
                          :components
                          ((:file "temperature-conversion"))))
  :depends-on   ("uiop"
                 "check-it"
                 "prove")
  :in-order-to ((test-op (test-op clkanrc-ch01.03-test))))
