;problem 1
(defun my_length (x) 
	(cond 
		((null x) 0)
		(t (+ 1 (my_length (cdr x))))
	)
)


;problem 2
(defun my_memq (x y) 
    (cond
        ((null y)())
        ((eq x (car y))(cons (car y)(cdr y)))
        (t(my_memq x (cdr y)))
	)
)

;problem 3
(defun my_append (x y)
    (cond
        ((and (null x)(null y))())
        ((not (null x))(cons(car x)(my_append (cdr x)y)))
        ((not (null y))(cons(car y)(my_append x(cdr y))))
    )
)

(print (my_append  '((a) (b) (c)) '((d) (e) (f))))   

;problem 4
(defun my_attach (x y)
    (cond
        ( (and (not (listp x))(null y))(cons x nil))
        (t
        (cond
            ((or (symbolp x)(numberp x))(append y (cons x nil)))
            ((listp x)(append y (cons x nil)))
        )
        )
    )
)

;problem 5
(defun my_assoc (x y)
    (cond
        ((eq x (car (car y)))(car y))
        ((not (null y))(my_assoc x (cdr y)))
    )
 
)

;problem 6
(defun freq (x y)
    (cond
        ((symbolp y)(cond
                        ((eq x y)(+ 1))
                        (t(+ 0))
                        )
        )
        (t(+ (freq x (car y)) (freq x (cdr y))))
    )
)

;problem 7
(defun mapping (y x)
    (cond
        ((null y)())
        ((< (car (car y)) x)(append (cdr (car y))(mapping (cdr y) x)))
         (t(mapping (cdr y) x))
      )  
)


;problem 8
;inner check if there if any more x in y
;update check to np accordingly 
(defun inner1 (x y)
        (cond
            ((null (car y))())
            ((eq x (car y))(setq check 'np))
            (t(inner1 x (cdr y)))
        )
)
(defun my_last (x y)
    (setq check 'p)    
    (inner1 x (cdr y))
    (cond
        ((null (car y))())
        ((and(eq check 'p) (eq x (car y)))y)
        (t(my_last x (cdr y)))
    )   
)

;problem 9
(defun my-reverse (x)
    (cond
        ((null (car x))())
        ;((and (null (cdr x))(listp(car x)))())
        ((listp (car x))(append (my-reverse (cdr x)) (cons (car x) nil)))
        ((atom (car x))(append (my-reverse (cdr x)) (cons(car x) nil)))
    )
)

;problem 10
(defun is-pattern? (x y)
    (cond
        ((and (eq(car x)(car y))(inner2 x y))y)
        ((null (car y))())
        (t(is-pattern? x (cdr y)))
    )
)
(defun inner2 (x y)
        (cond
            ((not(eq (car x)(car y))) nil)
            ((not(null (cdr x)))(inner2 (cdr x)(cdr y)))
            (t t)
        )
)

;problem 11
(defun first-atom (x)
    (cond
        ((and(listp (car x))(not(null (car x))))(first-atom (car x)))
        ((null (car x)) nil)
        ((atom (car x))(car x))
    )
)






(print "problem 1----------------")
(print (my_length nil))                   				;-> 0
(print (my_length '(b (a b c))))          				;-> 2
(print (my_length '(a (((b))) c)))       				;-> 3
(print (my_length '(a b c)))    						;-> 3
(print "   ")

(print "problem 2----------------")
(print (my_memq 'a nil))    							;->	nil								            				
(print (my_memq 'b '(a b c)))               			;-> (b c)
(print (my_memq 'd '(a b c d e f g)))   				;->	(d e f g)
(print (my_memq 'd '(a b c d)))           				;-> (d)
(print (my_memq 'd '(a b c)))   						;-> nil
(print "   ")

(print "problem 3----------------")
(print (my_append '(a b c) '(d e f)))                   ;--> (a b c d e f)
(print (my_append '((a) (b) (c)) '((d) (e) (f))))       ;--> ((a) (b) (c) (d) (e) (f))
(print (my_append nil '(d e f)))                        ;--> (d e f)
(print (my_append '(a b c) nil))                        ;--> (a b c)
(print "   ")

(print "problem 4----------------")
(print (my_attach 'a nil))              				;--> (a)
(print (my_attach 'd '(a b c)))         				;--> (a b c d)
(print (my_attach '(a) '(b c)))         				;--> (b c (a))
(print "   ")

(print "problem 5----------------")
(print (my_assoc 'a nil))                        		;--> nil
(print (my_assoc 'a '((a . b)(c e f)(b))))       		;--> (a . b)
(print (my_assoc 'c '((a . b)(c e f)(b))))       		;--> (c e f)
(print (my_assoc 'b '((a . b)(c e f)(b))))       		;--> (b)
(print (my_assoc 'f '((a . b)(c e f)(b))))       		;--> nil
(print "   ")

(print "problem 6----------------")
(print (freq  'c '((a c) c e)))                        	;--> 2
(print (freq  'f '(((s) o ) d)))                       	;--> 0
(print (freq  'f '(((f) f) f f)))                      	;--> 4
(print "   ")

(print "problem 7----------------")
(print (mapping '((35 kim) (67 clinton) (45 emma))  40));--> (kim)
(print (mapping '((24 a) (15 b) (56 c) (19 d)) 26))     ;--> (a b d)
(print (mapping '((90 a) (80 b) (70 c))  40))           ;--> nil
(print "   ")

(print "problem 8----------------")
(print (my_last 'a '(a b c a b c a b c d e f g)))       ;-->    (a b c d e f g)
(print (my_last 'b '(a b c a b c a b c d e f g)))       ;-->    (b c d e f g)
(print (my_last 'c '(a b c a b c a b c d e f g)))       ;-->    (c d e f g)
(print (my_last 'g '(a b c a b c a b c d e f g)))       ;-->    (g)
(print (my_last 'h '(a b c a b c a b c d e f g)))       ;-->    nil
(print "   ")

(print "problem 9----------------")
(print (my-reverse nil))                                ;--> nil
(print (my-reverse '(a)))                               ;--> (a)
(print (my-reverse '(1 2 3 4 5)))                       ;--> (5 4 3 2 1)
(print (my-reverse '((1 2 3) 4 ((5 6)))))               ;--> (((5 6)) 4 (1 2 3))
(print "   ")
            
(print "problem 10----------------")
(print (is-pattern? '(a b s) '(c d b a s)))             ;--> nil
(print (is-pattern? '(c a c) '(b a j a c a c t u s)))   ;--> (c a c t u s)
(print (is-pattern? nil '(a n y l i s t)))              ;--> nil
(print (is-pattern? '(l i s p) nil))                    ;--> nil
(print "   ")

(print "problem 11----------------")
(print (first-atom nil))                                ;--> nil
(print (first-atom '((2 (1) 4) 6)))                     ;--> 2
(print (first-atom '((((s)) o ))))                      ;--> s
(print (first-atom '(1 (((2)) 3 4))))                   ;--> 1
(print "   ")



(my_assoc 'z '((a . 1)(b . 2)(c . 3)(b . z)))


