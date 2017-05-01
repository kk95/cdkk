# Stock Alert in Racket

## Kshitij Karke
### April 30, 2017

# Overview
This set of code allows an individual to configure the actions on the stock value and stock list

Using the GUI you can add stocks to a list and auto send a stock when a certain % change is detected

The values of the stock can be dsplayed in the GUI itself or you can send values to your phone


**Authorship note:** All of the code described here was written by myself, some references have been made to Chris' code.

# Libraries Used
The code uses 7 libraries:
(require mutt)
(require csv-reading)
(require net/url)
(require (prefix-in htdp: htdp/gui))
(require (prefix-in goo: racket/gui))


* The ```mutt``` library provides the ability to use your preconfigured mutt settings to send texts to your phone through an email server 
* The ```csv-reading``` library (used by Chris) provides the ability to get Stock Values from the YAHOO FINANCE API 
* The ```net-url``` library is used to make queries to the same API
* The ```htdp/gui & racket/gui``` libraries provides the ability to crate the interface and add features to our program
# Key Code Excerpts

Here is a discussion of the most essential procedures, including a description of how they embody ideas from 
UMass Lowell's COMP.3010 Organization of Programming languages course.

Five examples are shown and they are individually numbered. 

## 1. Initerfacing with the GUI

This code was partially written by each of us, and is the central stitchings to combine front and back end.

Each of these functions is called by my gui, and his stock list object uses values to determine what to do.
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
 While using global objects is not a central theme in the course, it's necessary to show this code to understand
 the later examples.
 
## 2. Setting up phone # configuration 
This code was written using cond, begin and define statements that were taught in class. 
This section of the code appends a phone number to a configuration file
```
(define (set_config a)
  (begin (write-to-file (string-append (htdp:text-contents conf) (index->prov (htdp:choice-index prov))) "./config.txt" #:exists 'replace) #t)) 
(define (index->prov idx) (cond ((= idx 0) "@txt.att.net")
                                ((= idx 1) "@tmomail.net")
                                ((= idx 2) "@vtext.com")
                                ((= idx 3) "@pm.sprint.com")
                                ((= idx 4) "@vmobl.com")))

```
## 3. Using lists for the GUI layout

The following code uses a list layout to show the predefined buttons in the GUI, a list with a single item has all the items in that list on the same line, each new 'list' is a new line in the GUI
```
(htdp:create-window  (list (list conf)(list prov)(list set_conf)(list h) (list g j) (list a b f) (list c d e) (list i)))
```

## 4. Sending the text

The send-txt function gets called in the check_stocks function to send the text when the map function is run on a timer to see the difference in the stocks

```
(define (send-txt txtm)
  (mutt (string-join(get-stock-values txtm))
      #:to (string-join (file->lines "./config.txt"))
      #:subject txtm)
```
```
(define (check_stocks)
  (if (stock_list 'send?) (map (lambda (x) (if
                                            (> (first (get-stock-values (first x)))
                                               (* (second (first (member
                                                                  (first x)
                                                                  (stock_list 'get_list)
                                                                  (lambda (findval listval) (equal? findval (first listval))))))
                                                  1.1)) (send-txt (first x)) 0)) (stock_list 'get_list)) 0))
```
## 5. make-stock function

This function uses let, lambda and cond that were taught in the course.
It gets the command from the evaluator that we made to return a value for open/close price or to call the send-txt function.

```
(define (make-stock symbolname)
  (let ((stocksymbol symbolname)
        (stockvals (get-stock-values symbolname)))
        (lambda (command)
          (cond [(eq? command 'symbol) stocksymbol]
                [(eq? command 'open) (cadr stockvals)]
                [(eq? command 'close) (car stockvals)]
                [(eq? command 'send) (send-txt stocksymbol)]))))
```
