#lang racket

(require mutt)
(require csv-reading)
(require net/url)
(require xml)
(require html)
(require (prefix-in htdp: htdp/gui))

(print "Command Line:")

(newline)



(define (get-stock-values stksymbol)
  (map cadr (cdadr (csv->sxml (pcdata-string (car (read-html-as-xml (get-pure-port (string->url (string-append "http://download.finance.yahoo.com/d/quotes.csv?s=" stksymbol "&f=bop"))))))))))

;(define (stkinterp invalues)
;  (cond [(eq? (car invalues) 'add_stock) (make-stock (cadr invalues))]
;               [(eq? (car invalues) 'help) (begin
;                                             (print "add_stock STOCKNAME")
;                                             (newline))]))
         ;(stkinterp (read))))

(define (make-stock-list)
  (let ((stocklst (list)))
    (lambda (command . opt)
      (cond [(eq? command 'add_stock) (set! stocklst (append stocklst (list (car opt))))]
            [(eq? command 'remove_stock) (set! stocklst (remove (car opt) stocklst))]
            [(eq? command 'get_list)  stocklst]))))

(define stock_list (make-stock-list))

(define (make-stock symbolname)
  (let ((stocksymbol symbolname)
        (stockvals (get-stock-values symbolname)))
        (lambda (command)
          (cond [(eq? command 'symbol) stocksymbol]
                [(eq? command 'open) (cadr stockvals)]
                [(eq? command 'close) (car stockvals)]
                [(eq? command 'send) (send-txt stocksymbol)]))))

(define text_box (htdp:make-text ""))

(htdp:create-window (list (list text_box)))

(define (add_stock a)
  (stock_list 'add_stock (htdp:text-contents text_box)))
(define (remove_stock a)
  (stock_list 'remove_stock (htdp:text-contents text_box)))
(define (view_purchase a)
  (htdp:draw-message i (first (get-stock-values (htdp:text-contents text_box)))))
(define (view_open a)
  (htdp:draw-message i (second (get-stock-values (htdp:text-contents text_box)))))
(define (view_close a)
  (htdp:draw-message i (third (get-stock-values (htdp:text-contents text_box)))))
(define (send a)
  (send-txt (htdp:text-contents text_box)))
;(define (send_auto a)
  ;(stock_list '



;(define temp (map cadr (cdadr (csv->sxml (pcdata-string (car (read-html-as-xml myport)))))))

(define (send-txt txtm)
  (mutt (string-join(get-stock-values txtm))
      #:to "9789962939@tmomail.net"
      #:subject txtm))
