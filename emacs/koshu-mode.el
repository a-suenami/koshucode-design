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
       koshu-mode-font-lock)
  (make-local-variable 'font-lock-extend-region-functions)
  (add-hook 'font-lock-extend-region-functions
            'koshu-font-lock-extend-region)
  )

(defvar koshu-mode-syntax-table
  (let ((table (make-syntax-table text-mode-syntax-table)))
    (modify-syntax-entry ?_ "w" table)
    (modify-syntax-entry ?- "w" table)
    (modify-syntax-entry ?+ "w" table)
    table)
  "Syntax table used in Koshu mode.")

(defun koshu-font-lock-extend-region ()
  (save-excursion
    (goto-char font-lock-beg)
    (when (re-search-backward "^[*][*][*][*]" nil t)
      (goto-char font-lock-end)
      (when (re-search-forward "^[^ \t]" nil t)
        (beginning-of-line)
        (setq font-lock-end (point))))))

(defvar koshu-insert-bracket-prev nil
  "Previous input for bracket keyword.")

(defun koshu-insert-bracket (keyword)
  "Insert bracket keyword."
  (interactive "sBracket keyword: ")
  (setq koshu-insert-bracket-prev
        (if (string-equal keyword "")
            koshu-insert-bracket-prev
          keyword))
  (insert-pair nil ?< ?>)
  (insert koshu-insert-bracket-prev)
  (re-search-forward "> ?" (+ 2 (point)) t))

(defvar koshu-mode-font-lock
  `(( ;; clause comment (from "****" to beginning of next clause)
     ("^\\([*][*][*][*]\\)\\(.*\n\\(\n\\|[ \t].*\n\\)*\\)"
      (1 font-lock-comment-delimiter-face)
      (2 font-lock-comment-face))

     ;; line comment
     ("\\([*][*]\\)\\(.*\\)"
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

     ;; bracket keyword
     ("<1>" . font-lock-builtin-face)
     ("\\(<\\)\\(\\w+\\)\\(>\\)" . font-lock-keyword-face)

     ;; term name
     ("\\(/\\)\\(\\w+\\)"
      (1 font-lock-builtin-face)
      (2 font-lock-variable-name-face))

     ;; slot name
     ("\\(@+\\)\\(['*]*\\w*\\)"
      (1 font-lock-builtin-face)
      (2 font-lock-variable-name-face))

     ;; variables of function abstruction
     ("\\((\\)\\(| *\\(\\w *\\)*|\\)"
      (1 font-lock-variable-name-face)
      (2 font-lock-variable-name-face))
     ("\\(|\\)\\()\\)"
      (1 font-lock-variable-name-face)
      (2 font-lock-variable-name-face))

     ;; punctuation
     ("[]:=|(){}#[]\\|---" . font-lock-builtin-face)

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

     ;; keyword
     ("^short"
      . font-lock-keyword-face)

     ;; shebang
     ("^\\(#!\\)\\(.*\\)"
      (1 font-lock-keyword-face)
      (2 font-lock-string-face))

     ;; operators (rop or syntactic cop)
     (,(concat
        " " ;; space before operators
        (regexp-opt
         '("koshu-cop" "koshu-cop-infix" "koshu-rop" "koshu-version"
           "add" "check-term" "compose" "const" "dump" "duplicate"
           "fix" "fix-join" "both" "if" "keep" "maybe" "member"
           "number" "omit" "prefix" "prefix-change" "range" "rank"
           "rdf" "repeat" "size" "subst" "typename" "unless"
           "unprefix" "when" "contents" "cut" "cut-term" "dee" "dum"
           "empty" "equal" "id" "join" "meet" "none" "pick"
           "pick-term" "rename" "move" "some" "source" "source-term"
           "sub" "append" "copy" "down" "for" "group" "group-by"
           "join-up" "nest" "unnest" "slice" "slice-up" "split" "up"
           ;; attribute editor
           "fill" "opt"
           ) t)
        "\\>")
      . font-lock-keyword-face)
     )))

