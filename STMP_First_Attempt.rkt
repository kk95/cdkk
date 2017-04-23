#lang racket

(require mutt)

(mutt "test string"
      #:to "9789962939@tmomail.net"
      #:subject "STOCK ALERT")