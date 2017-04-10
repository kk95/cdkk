#lang racket

(require csv-reading)
(require net/url)

(print "Enter the stock symbol with double quotes around it")

(define stksymbol (read))

(define stkurl (string-append "http://download.finance.yahoo.com/d/quotes.csv?s=" stksymbol "&f=abo"))

(define myurl (string->url stkurl))
(define myport (get-pure-port myurl))
(display-pure-port myport)