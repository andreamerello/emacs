;; ------ set all theme stuff ---------
(require 'xcscope)
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
(column-number-mode 1)


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

(defun my-indent-linux ()
(interactive)
(setq c-default-style "linux")


)

(defun my-indent-2 ()
(interactive)
;;(setq c-basic-indent 2)
(setq c-basic-offset 2)
(setq tab-width 2)
(setq indent-tabs-mode nil)
;(setq indent-line-function 'insert-tab)
)

; ------- GTAGS RELATED 

(defun my-gtags-root-dir ()
    "Returns GTAGS root directory or nil if doesn't exist."
    (interactive)
    (with-temp-buffer
      (if (zerop (call-process "global" nil t nil "-pr"))
          (buffer-substring (point-min) (1- (point-max)))
        nil)))

(defun my-gtags-update ()
   "Make GTAGS incremental update"
   (interactive)  
   (call-process "global" nil nil nil "-u"))


(defun my-gtags-update-single(filename)	
      "Update Gtags database for changes in a single file"
      (interactive)
      (start-process "update-gtags" "update-gtags" "bash" "-c" (concat "cd " (gtags-root-dir) " ; gtags --single-update " filename )))

(defun my-gtags-update-current-file()
      (interactive)
      (defvar filename)
      (setq filename (replace-regexp-in-string (gtags-root-dir) "." (buffer-file-name (current-buffer))))
      (gtags-update-single filename)
      (message "Gtags updated for %s" filename))


(defun my-gtags-update-hook()
      "Update GTAGS file incrementally upon saving a file"
      (when gtags-mode
        (when (my-gtags-root-dir)
          (my-gtags-update-current-file))))


;;(setq gtags-path-style 'absolute)

(defun my-gtags-mode ()
  "Turn `gtags-mode' on if a global tags file has been generated"
  (interactive)
  (when (my-gtags-root-dir)
      (message "Activating gtags-mode")
      (setq default-directory (my-gtags-root-dir))       
      (gtags-mode 1)
      (setq gtags-rootdir (my-gtags-root-dir))))
      

          

; --------- GDB/ openocd related

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



;; ---------------------- hooks ---------------------------
;;(add-hook 'after-save-hook 'my-gtags-update-hook)
;;(add-hook 'after-load-hook 'my-gtags-load-hook)
;;(add-hook 'c-mode-common-hook 'my-gtags-mode)




; ---------------------- key bindings ---------------------
(global-set-key [(meta down)] 'scroll-up-line)
(global-set-key [(meta up)] 'scroll-down-line)
(global-set-key [(ctrl .)] 'gtags-find-rtag)

;; TODO find a good key
;;(global-set-key [f8] 'gtags-show-callers)
