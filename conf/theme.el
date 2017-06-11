;; ------ set all theme stuff ---------
(add-to-list 'custom-theme-load-path "~/emacs")
(require 'color-theme)

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

(defun my-theme-sunlight ()
  (interactive)
  (load-theme 'mytheme24-light t)
  (message "set sunlight theme")
)

(defun my-theme-normal ()
  (interactive)
  (load-theme 'mytheme24 t)
  (message "set normal theme")
)

;; -------- end of theme stuff -------------
