#lang racket


(require mutt)
(require csv-reading)
(require net/url)
(require xml)
(require html)
(require (prefix-in htdp: htdp/gui))
(require (prefix-in goo: racket/gui))


(define (get-stock-values stksymbol)
  (map cadr (cdadr (csv->sxml (pcdata-string (car (read-html-as-xml (get-pure-port (string->url (string-append "http://download.finance.yahoo.com/d/quotes.csv?s=" stksymbol "&f=bop"))))))))))



(define (make-stock-list)
  (let ((stocklst (list))
        (stocksend #f)
        (lastsend (current-seconds)))
    (lambda (command . opt)
      (cond [(eq? command 'add_stock) (set! stocklst (append stocklst (list (first opt))))]
            [(eq? command 'remove_stock) (set! stocklst (remove (first opt) stocklst))]
            [(eq? command 'toggle_send) (if stocksend (set! stocksend #f) (set! stocksend #t))]
            [(eq? command 'send?) stocksend]
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




;(define (add_stock a) (begin (print "as") #t))
;(define (remove_stock a)  (begin  (print "stock") #t))
;(define (view_open a) (begin  (print "view_open") (htdp:draw-message i "<print open price>") #t))
;(define (view_purchase a)  (begin  (print "view_purchase") (htdp:draw-message i "<print current price>") #t))
;(define (view_close a)  (begin (print "close") (htdp:draw-message i "<print close price>") #t))
;(define (set_auto a)  (begin (print "set_auto") #t))
;(define (send a)  (begin (print "sent") #t))
(define (nothing a) #t)


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

(define a (htdp:make-button "Add Stock" add_stock))
(define b (htdp:make-button "Remove Stock" remove_stock))
(define c (htdp:make-button "View Purchase" view_purchase))
(define d (htdp:make-button "View Open" view_open))
(define e (htdp:make-button "View Close" view_close))
(define f (htdp:make-button "Send" send))
(define g (htdp:make-button "Auto Send" set_auto))
(define h (htdp:make-text "STOCK SYMB"))
(define i (htdp:make-button " " nothing))
(define j (htdp:make-text "Notify when stock changes by:"))

(htdp:create-window  (list (list h) (list g j) (list a b f) (list c d e) (list i)))


(define text_box h)

(define (check_stocks)
  (if (stock_list 'send?) (send-txt (htdp:text-contents text_box)) 0))

(define timeguy (new goo:timer% [notify-callback check_stocks]
                                [interval 10000]
                                [just-once? #f]))

(define (send-txt txtm)
  (mutt (string-join(get-stock-values txtm))
      #:to "9789962939@tmomail.net"
      #:subject txtm))
