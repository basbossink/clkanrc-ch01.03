(asdf:defsystem "clkanrc-ch01.03-test"
  :defsystem-depends-on ("prove-asdf")
  :version      "0.1.0"
  :author       "Bas Bossink <bas.bossink@gmail.com>"
  :serial       t
  :license      "Simplified 2-clause BSD"
  :components   ((:module "test"
                          :components
                          ((:test-file "temperature-conversion-test"))))
  :depends-on   ("clkanrc-ch01.03"
                 "check-it"
                 "prove")
  :perform (test-op :after (op c) (funcall (intern #. (string :run) :prove) c)))
