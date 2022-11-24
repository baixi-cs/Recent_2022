#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     CS 381 - Programming Lab #4		;
;										;
;             Xiaoqin Bai			 	;
;      baixi@oregonstate.edu       	;
;										;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;define
;#t, #f 
;car, cdr, cadr, ... (etc.)
;?first, second, ..., rest, last  
;cons, append
;eq?, eqv?, equal?       
;pair?, list?
;null?, null, empty? 
;if, cond, else   
;refer from Tutorial 4 http://www.cs.toronto.edu/~sheila/324/w07/tuts/ST_Tutorial4.pdf


; your code here
;(writeln "0------------------------------------Length function **w")
(define (length lst)
  (cond
     [(empty? lst) 0]  ;if empty list,then return 0
     [else (+ 1 (length (cdr lst)))] ;get the lst length
  )
)

;(writeln "1------------------------------------Member? function **w")
(define (member? e lst)
  (cond 
    [(empty? lst) #f] ;if empty list,then return false
    [else 
      (cond
        [(equal? e (car lst)) #t] ; if ele = arr first ele: return true
        [else 
          (member? e (cdr lst))  ;go to next ele = rest of arr 's first ele
        ]
      )
    ]
  )
)

#|(writeln (member? 'a '(a b c)) )    ;t
(writeln (member? 'b '(a b c)) )    ;t
(writeln (member? 'c '(a b c)) )    ;t
(writeln (member? 'd '(a b c)) )    ;f
(writeln (member? 'x '()) )         ;f
|#

;(writeln "2------------------------------------Set? function **n")
(define (set? lst)
    (if (null? lst)   ;if empty list,then return true                          
        #t                                      
        (if ( = (length lst) 1)    ;if list length == 1,then return true            
            #t
            (if (member? (car lst) (cdr lst))  ;if arr first ele is not rest of array's memb
                #f
                (if (set? (cdr lst))  ; continue to check the rest of array's set.
                    #t 
                    #f
                )
            )
        )
    )
)

#|(writeln (set? '()) )             ;t
(writeln (set? '(x)) )            ;t
(writeln (set? '(x x)) )          ;f
(writeln (set? '(x y z)) )        ;t---f
(writeln (set? '(x y y)) )        ;f----
(writeln (set? '(x y z x)) )      ;f
|#



;(writeln "3------------------------------------Union function **w")
(define (union lst1 lst2)
  (if (empty? lst2) lst1  ;if empty lst2,then return lst1
    (if (member (first lst2) lst1)  ;if first arr lst2 ele is member of lst1
        (union lst1 (rest lst2)) ; union lst and rest of lst2
        (union (cons (first lst2) lst1) (rest lst2)) ;  construct the lst2 head and append lst1 tail
    )
  )  
)


#|(writeln (union '(a b c) '(x y z)) )
(writeln (union '(a b c) '(a b c)) )
(writeln (union '(a b c) '(1 2 3 a)) )
(writeln (union '(to be) '(or not to be)) )
(writeln (union '(a b c) '(c b a)) )
'(c b a x y z)
'(a b c)
'(c b 1 2 3 a)
'(or not to be)
'(c b a)|#

;(writeln "4------------------------------------Intersect function **w")

(define (intersect lst1 lst2) 
  (if (empty? lst1) empty ;if empty lst1,then return none
    (if (member? (first lst1) lst2) ;if lst1'head is lst2's member
      (cons (first lst1) (intersect (rest lst1) lst2)) ;add lst1'head and recur's output  (cons 5 10)->(5.10)
      (intersect (rest lst1) lst2) ;find the rest of lst1
    )
  )  
)

#|
(writeln (intersect '(x) '(x)) )
(writeln (intersect '(x y z) '(x a y b c)) )
(writeln (intersect '(x y z) '(a b z)) )
(writeln (intersect '(green eggs) '(and ham)) )
(writeln (intersect '(stewed tomatoes and macaroni) '(macaroni and cheese)) )
'(x)
'(x y)
'(z)
'()
'(and macaroni)
|#

;(writeln "5------------------------------------Difference Function **w")
(define (difference lst1 lst2) ;A-B
  (if (empty? lst1) empty ;if empty lst1,then return none
    (if (member? (first lst1) lst2) ;if lst1'head is lst2's member
      (difference (rest lst1) lst2) ; find the rest of lst1
      (cons (first lst1) (difference (rest lst1) lst2)) ;add lst1'head and recur's lst1 output (cons 5 10)->(5.10)
    )
  )  
)

#|
(writeln (difference '(1) '(1)) )
(writeln (difference '(1 2 3 4) '(3 4 5 6)) )
(writeln (difference '(a b c d) '(b d e)) )
(writeln (difference '(b d e) '(a b c d)) )
(writeln (flatten '(1 (6) 2 3), '(4 5) ))
(writeln (difference '(patience you must have) '(my young padawan)) )
'()
'(1 2)
'(a c)
'(e)
'(patience you must have)
|#

;(writeln "6------------------------------------Flatten Function (Extra Credit) **w")


(define (flatten lst1 lst2)
  (cond
      [(and (empty? lst1) (empty? lst2)) '()]
      [(empty? lst1) lst2]
      [(empty? lst2) lst1]
   
  )   
)
;(writeln (flatten '(a (b v)) '(c d) ) );-> a c d b v
;(writeln (flatten '(a) '() ) )



;;;;;;;;;;;;;;;;;
;  DO NOT EDIT  ;
;;;;;;;;;;;;;;;;;
; enables testing via piping in stdin
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
(let loop ()
  (define line (read-line (current-input-port) 'any))
  (if (eof-object? line)
    (display "")
    (begin (print (eval (read (open-input-string line)) ns)) (newline) (loop))))