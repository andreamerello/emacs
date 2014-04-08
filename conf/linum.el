;; face is in theme

;; --------- shows column number in status bar
(column-number-mode 1)

; ---------- show line number left to text
(add-hook 'prog-mode-hook (lambda() (interactive) (global-linum-mode 1)))

;; --------- draws separator for line number
(unless window-system
  (setq linum-format "%4d\u2502")
)
