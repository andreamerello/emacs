;; ---------- disable initial spash and 2-window split
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message "")

;; --------- shows column number in status bar
(column-number-mode 1)

;; --------- draws separator for line number
(unless window-system
  (setq linum-format "%4d\u2502 ")
)

; ----------- Show file full path in title bar -------
(setq-default frame-title-format
   (list '((buffer-file-name " %f"
             (dired-directory
              dired-directory
              (revert-buffer-function " %b"
              ("%b - Dir:  " default-directory)))))))

;; ------- when searching TAGS in code, make it case SENSITIVE
(setq tags-case-fold-search nil)

;; ------ set default font
(when window-system
    (set-face-attribute 'default nil :font "Monospace-10")
)

; show line number left to text
(add-hook 'prog-mode-hook (lambda() (interactive) (global-linum-mode 1)))
