;1.14 - can't really draw it here

;1.15 -------------------------------------------
;(a)
; sin(12.5) = p(sin(4.05)) = p(p(sin(1.35))) = p(p(p(sin(0.45)))) = p(p(p(p(0.15)))) = p(p(p(p(0.05))))
;p is applied thrice

;(b)
;when sin(a) is evaluated, floor(a / 3) times p is evaluated 
;(since the angle is divided by 3) each time, the number of steps needed to get the angle < 1
;is log a base 3 (since the log of a number gives us the number of times a number contains
;	factors of another number)
;so, the growth is logarithmic
;space - space is linear in growth - a single parameter function.
