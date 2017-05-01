# Stock Alert in Racket

## Christian Dumas
### April 30, 2017

# Overview
This set of code allows an individual to perform several actions on stock values.

Using Yahoo finance, a list of stock tickers can be made which periodically sends updates of increases or decreases (negative increases).

You can also quickly send immediate values, or view immediate values through the GUI.

**Authorship note:** All of the code described here was written by myself.

# Libraries Used
The code uses four libraries:

```
(require net/url)
(require xml)
(require html)
(require (prefix-in goo: racket/gui))
```

* The ```net/url``` library provides the ability to make queries to the Yahoo Finance API.
* The ```xml``` library is used to allow access to xml utilities to access the stock values.
* The ```html``` library is also used to parse stock values.
* The ```racket/gui``` library is used to access timer constructs.

# Key Code Excerpts

Here is a discussion of the most essential procedures, including a description of how they embody ideas from 
UMass Lowell's COMP.3010 Organization of Programming languages course.

Four examples are shown and they are individually numbered. 

## 1. Map to parse fairly arbitrary data into strings.

The following code gets and fully parses a list of stock values as a list of strings.

```
(define (get-stock-values stksymbol)
  (map cadr (cdadr (csv->sxml (pcdata-string (car (read-html-as-xml (get-pure-port (string->url (string-append "http://download.finance.yahoo.com/d/quotes.csv?s=" stksymbol "&f=bop"))))))))))
 ```
 
It takes a string input.
 
## 2. Initialization using a Global Object

This procedure produces a "stock-list" object which has the shown local procedures.

```
(define (make-stock-list)
  (let ((stocklst (list))
        (stocksend #f)
        (lastsend (current-seconds)))
    (lambda (command . opt)
      (cond [(eq? command 'add_stock) (set! stocklst (append stocklst (list (cons (first opt) (get-stock-values (first opt))))))]
            [(eq? command 'remove_stock) (set! stocklst (remove (first opt) stocklst (lambda (x y) (equal? x (car y)))))]
            [(eq? command 'toggle_send) (if stocksend (set! stocksend #f) (set! stocksend #t))]
            [(eq? command 'send?) stocksend]
            [(eq? command 'get_list)  stocklst]))))
```

## 3. Interfacing with the GUI

This code was partially written by each of us, and is the central stitchings to combine front and back end.

Each of these functions is called by his gui, and my stock list object uses values to determine what to do.

```
(define (add_stock a)
  (begin (stock_list 'add_stock (htdp:text-contents text_box)) #t))
(define (remove_stock a)
  (begin (stock_list 'remove_stock (htdp:text-contents text_box)) #t))
(define (view_purchase a)
  (begin (htdp:draw-message i (first (get-stock-values (htdp:text-contents text_box)))) #t))
(define (view_open a)
  (begin (htdp:draw-message i (second (get-stock-values (htdp:text-contents text_box)))) #t))
(define (view_close a)
  (begin (htdp:draw-message i (third (get-stock-values (htdp:text-contents text_box)))) #t))
(define (send a)
  (begin (send-txt (htdp:text-contents text_box)) #t))
(define (set_auto a)
  (begin (stock_list 'toggle_send) #t))
```

## 4. Mapping to print values which fit a criteria.

The following code is our stock checking algorithm.

It simply triggers an event each timer tick that checks the entire stock list to see if any of the values have changed by the desired amount.

```
(define (check_stocks)
  (if (stock_list 'send?) (map (lambda (x) (if
                                            (> (first (get-stock-values (first x)))
                                               (* (second (first (member
                                                                  (first x)
                                                                  (stock_list 'get_list)
                                                                  (lambda (findval listval) (equal? findval (first listval))))))
                                                  1.1)) (send-txt (first x)) 0)) (stock_list 'get_list)) 0))

(define timeguy (new goo:timer% [notify-callback check_stocks]
                                [interval 1000]
                                [just-once? #f]))
```
