(require 'color-theme)
(add-to-list 'custom-theme-load-path "~/emacs")

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("247f6696cd7430c01284130599ffc2caa8abe205498992174d38ff154d28565e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'mytheme24 t)


(show-paren-mode 1)

(setq compilation-scroll-output 1)

(setq c-basic-indent 2)
(setq tab-width 2)
(setq indent-tabs-mode nil)

(setq highlight-tabs 1)
(setq highlight-trailing-whitespace 1)

(defun my-show-tabs ()
  (interactive)
  (let ((i 0) (disptab make-display-table)))
    (while (&lt; i 32)
      (or (= i ?\n)
          (aset disptab i (vector ?^ (+ i 64))))
      (setq i (1+ i)))
    (aset disptab 127 (vector ?^ ??))
    (setq buffer-display-table disptab)))

(defun my-hide-tabs ()
  (interactive)
  (let ((i 0) (disptab make-display-table)))
    (while (&lt; i 32)
      (or (= i ?\n) (= i ?\t)
          (aset disptab i (vector ?^ (+ i 64))))
      (setq i (1+ i)))
    (aset disptab 127 (vector ?^ ??))
    (setq buffer-display-table disptab)))