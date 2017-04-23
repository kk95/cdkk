#lang racket

(require mutt)

(mutt "testing"
      #:to "9789962939@tmomail.net"
      #:subject "hello world")