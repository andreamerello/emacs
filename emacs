;; ------ set all theme stuff ---------

(require 'color-theme)
(add-to-list 'custom-theme-load-path "~/emacs")

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

;; -------- end of theme stuff -------------

;; ---------- disable initial spash and 2-window split
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; --------- hilight pharentesys in code
(show-paren-mode 1)

;; --------- shows column number
(show-column number 1)


; ----------- Show file full path in title bar -------
(setq-default frame-title-format
   (list '((buffer-file-name " %f"
             (dired-directory
              dired-directory
              (revert-buffer-function " %b"
              ("%b - Dir:  " default-directory)))))))

;; when compiling scroll down
;(setq compilation-scroll-output 1)

;; -------  indentation and tabs for C code

(setq c-default-style "linux")
;(setq c-basic-indent 2)
;(setq tab-width 2)
;(setq indent-tabs-mode nil)

;; ------ tabs hilight stuff  ------------
(setq highlight-tabs 1)
(setq highlight-trailing-whitespace 1)


;; ------- when searching TAGS in code, make it case SENSITIVE
(setq tags-case-fold-search nil)

;; ------ set default font
(when window-system  
    (set-face-attribute 'default nil :font "Monospace-10")
)


; -------------------- custom funcs --------------
(defun my-gdb-host ()
  (interactive)
  (setq gud-gdb-command-name "gdb -i=mi")
  (message "gdb for host programs")
)

(defun my-gdb-openocd-arm ()
  (interactive)
  (setq gud-gdb-command-name "arm-none-eabi-gdb -i=mi -x openocd.gdb")
  (message "gdb for ARM/openocd")
)


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
;; end tabs hilight stuff  ------------



; ---------------------- key bindings ---------------------
(global-set-key [(meta down)] 'scroll-up-line)
(global-set-key [(meta up)] 'scroll-down-line)
(global-set-key [(ctrl .)] 'gtags-find-rtag)