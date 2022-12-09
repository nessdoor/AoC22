;;; -*- lexical-binding: t; -*-
(require 'f)
(let ((ht
       ;; Lookup table for round-to-score conversion
       #s(hash-table test equal
                     size 10
                     data ("A X" 3 "B X" 1 "C X" 2
                           "A Y" 4 "B Y" 5 "C Y" 6
                           "A Z" 8 "B Z" 9 "C Z" 7
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
