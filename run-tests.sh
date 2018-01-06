#!/usr/bin/env sh

sbcl --noinform\
     --no-sysinit\
     --non-interactive\
     --eval '(ql:quickload :prove)'\
     --eval '(prove:run :clkanrc-ch01.03-test :reporter :tap)'
