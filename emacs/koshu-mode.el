;;; koshu mode

(defgroup koshu nil
  "Major mode for editing Koshucode."
  :group 'languages
  :prefix "koshu-")

(unless (fboundp 'prog-mode)
  (defalias 'prog-mode 'fundamental-mode))

(define-derived-mode koshu-mode prog-mode "Koshu"
  "A Mode for editing Koshucode."
  :syntax-table koshu-mode-syntax-table

  ;; comment
  (set (make-local-variable 'comment-start)   "**")
  (set (make-local-variable 'comment-padding) 2)
  (set (make-local-variable 'comment-end)     "")

  ;; font-lock
  (set (make-local-variable 'font-lock-defaults)
       koshu-mode-font-lock))

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
     ("^\\(|[=xX]+\\) +\\(\\w+\\)"
      (1 font-lock-builtin-face)
      (2 font-lock-function-name-face))
     ("^\\(|\\)\\([=vV]+\\) +\\(\\w+\\)"
      (1 font-lock-builtin-face)
      (2 font-lock-warning-face)
      (3 font-lock-function-name-face))
     ("^\\(|\\)\\([-vVxX]+\\) +\\(\\w+\\)"
      (1 font-lock-builtin-face)
      (2 font-lock-function-name-face)
      (3 font-lock-function-name-face))

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

     ;; arrows
     (,(regexp-opt '("<-" "->" "<<" ">>") t)
      . font-lock-builtin-face)

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

     ;; operators (rop or syntactic cop)
     (,(concat
        " " ;; space before operators
        (regexp-opt
         '("add" "check-term" "cut" "duplicate" "empty" "enclose"
           "full" "group" "hold" "id" "if" "join" "maybe" "meet" "member"
           "none" "pick" "prefix" "prefix-change" "range" "rank" "reldee"
           "reldum" "rename" "size" "some" "typename" "unprefix") t)
        "\\>")
      . font-lock-keyword-face)
     )))

