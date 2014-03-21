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

     ;; quotation mark
     ("\\('\\)\\([\\w]+\\)"
      (1 font-lock-keyword-face)
      (2 font-lock-string-face))

     ;; double-quoted text
     ("\\(\"\\)\\([^\"\n]*\\)\\(\"\\)"
      (1 font-lock-keyword-face)
      (2 font-lock-string-face)
      (3 font-lock-keyword-face))

     ;; term name
     ("\\(/\\)\\(\\w+\\)"
      (1 font-lock-builtin-face)
      (2 font-lock-variable-name-face))

     ;; variables of function abstruction
     ("(|\\(\\( *\\w\\)+\\)"
      (1 font-lock-variable-name-face))

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

     ;; shebang
     ("^\\(#!\\)\\(.*\\)"
      (1 font-lock-keyword-face)
      (2 font-lock-string-face))

     ;; operators (rop or syntactic cop)
     (,(concat
        " " ;; space before operators
        (regexp-opt
         '("add" "check-term" "compose" "contents"
           "cut" "cut-term" "duplicate" "empty"
           "enclose" "fix" "fix-join" "full" "group"
           "id" "if" "join" "keep" "maybe" "meet"
           "member" "none" "number" "omit" "pick" "pick-term"
           "prefix" "prefix-change" "range" "rank" "reldee"
           "reldum" "rename" "repeat" "size" "some" "subst"
           "typename" "unless" "unprefix" "when") t)
        "\\>")
      . font-lock-keyword-face)
     )))

