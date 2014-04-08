;; ---------- disable initial spash and 2-window split
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; --------- shows column number
(column-number-mode 1)

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

(add-hook 'prog-mode-hook (lambda() (interactive) (global-linum-mode 1)))
