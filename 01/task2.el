;;; -*- lexical-binding: t; -*-

(let ((elf-sum
       (lambda (elf-calories all-calories lines)
         (while (consp lines)
           ;; Inventory for this elf is complete
           (if (string= (car lines) "")
               (progn
           ;; Sum and prepend calories of last elf to global calorie list
           (setq all-calories
                 (cons (apply '+ elf-calories) all-calories))
           ;; Init new elf calories list
           (setq elf-calories '())
           (setq lines (cdr lines)))
           ;; New calorie value
           (progn
             ;; Read value and store in elf calories list
             (setq elf-calories
                   (cons (string-to-number (car lines)) elf-calories))
             (setq lines (cdr lines)))))
         all-calories)))
  (apply '+
         (seq-take 
          (sort
           (funcall elf-sum '() '()
                    (split-string
                     (with-temp-buffer
                       (insert-file-contents-literally "input1.txt")
                       (buffer-substring-no-properties (point-min) (point-max)))
                     "\n"))
           #'>)
          3)))
