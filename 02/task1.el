;;; -*- lexical-binding: t; -*-
(require 'f)
(let ((ht
       ;; Lookup table for round-to-score conversion
       #s(hash-table test equal
                     size 10
                     data ("A X" 4 "B X" 1 "C X" 7
                           "A Y" 8 "B Y" 5 "C Y" 2
                           "A Z" 3 "B Z" 9 "C Z" 6
                           ;; Ignore empty lines
                           "" 0))))
  ;; Sum scores for each round
  (seq-reduce
   (lambda (sum line)
     (+ sum (gethash line ht))) ; Look score up in the table
   ;; Convert input to a list of lines
   (split-string
    (f-read-bytes "input2.txt")
    "\n")
   0))
