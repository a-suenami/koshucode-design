;;; koshu mode

(define-derived-mode koshu-mode text-mode "Koshu"
  "A Mode for editing Koshucode."
  :syntax-table koshu-mode-syntax-table
  (setq font-lock-defaults koshu-mode-font-lock))
;; prog-mode

(defvar koshu-mode-syntax-table
  (let ((table (make-syntax-table text-mode-syntax-table)))
    (modify-syntax-entry ?_ "w" table)
    (modify-syntax-entry ?- "w" table)
    (modify-syntax-entry ?+ "w" table)
    table)
  "Syntax table used in Koshu mode.")

(defvar koshu-mode-font-lock
  `(( ;; clause comment
     ("^ *\\*\\*\\*\\*" . font-lock-comment-face)

     ;; line comment
     ("\\(\\*\\*\\)\\(.*\\)"
      (1 font-lock-comment-delimiter-face)
      (2 font-lock-comment-face))

     ;; assertion
     ("^\\(|\\)\\([-xX]+\\) +\\(\\w+\\)"
      (1 font-lock-builtin-face)
      (2 font-lock-function-name-face)
      (3 font-lock-function-name-face))
     ("^\\(|[=xX]+\\) +\\(\\w+\\)"
      (1 font-lock-builtin-face)
      (2 font-lock-function-name-face))

     ;; shebang
     ("^\\(#!\\)\\(.*\\)"
      (1 font-lock-keyword-face)
      (2 font-lock-string-face))

     ;; term name
     ("\\(/\\)\\(\\w+\\)"
      (1 font-lock-builtin-face)
      (2 font-lock-variable-name-face))

     ;; quotation
     ("'" . font-lock-string-face)

     ;; double-quoted text
     ("\\(\"\\)[^\"]*\\(\"\\)"
      (1 font-lock-string-face)
      (2 font-lock-string-face))

     ;; punctuation
     ("[]:|(){}#[]" . font-lock-builtin-face)

     ;; option
     (" -\\([-a-z]\\)+\\>" . font-lock-keyword-face)

     ;; prefix
     ("\\<\\([a-zA-Z0-9]+\\)\\(\\.\\)"
      (1 font-lock-builtin-face)
      (2 font-lock-builtin-face))

     ;; source
     ("\\<\\(source\\) +\\(\\w+\\)"
      (1 font-lock-keyword-face)
      (2 font-lock-function-name-face))

     ;; relation-mapping operators
     (,(concat
        " " ;; space before operators
        (regexp-opt
         '("add" "cut" "duplicate" "empty" "enclose" "full"
           "group" "hold" "id" "join" "maybe" "meet" "member"
           "none" "pick" "prefix" "prefix-change" "range"
           "rank" "reldee" "reldum" "rename" "size" "some"
           "typename" "unprefix") t)
        "\\>")
      . font-lock-keyword-face)
     )))

