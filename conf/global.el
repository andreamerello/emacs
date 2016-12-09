;; -- license: GNU GPL

;; ---------- disable initial spash and 2-window split
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message "")

; ----------- no toolbar
(tool-bar-mode -1)

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

;;
;; -- windows size stuff
;; -- based on pieces of frame-cmds.el
;; -- Copyright (C) Drew Adams
;;

(defun frcmds-extra-pixels-height (frame)
  "Pixel difference between FRAME total height and its text area height."
  (- (frame-pixel-height frame) (* (frame-char-height frame) (frame-height frame))))

(defcustom window-mgr-title-bar-pixel-height (cond ((eq window-system 'mac) 22)
                                                   ;; For older versions of OS X, 40 might be better.
						   ((eq window-system 'ns)  50)
						   (t  27))
  "*Height of frame title bar provided by the window manager, in pixels.
You might alternatively call this constant the title-bar \"width\" or
\"thickness\".  There is no way for Emacs to determine this, so you
must set it."
  :type 'integer :group 'Frame-Commands)

(defun frcmds-smart-tool-bar-pixel-height (&optional frame)
  "Pixel height of Mac smart tool bar."
  (if (and (boundp 'mac-tool-bar-display-mode)  (> (frame-parameter frame 'tool-bar-lines) 0))
      (if (eq mac-tool-bar-display-mode 'icons) 40 56)
    0))


;; ------ set default size.
(when window-system
  ;;(maximize-frame-vertically)
  ;;(setq max_height (frame-height))
  ;; ------ Width is 120 cols

  (setq frame (selected-frame))
;  (setq fr-pixel-height  (frcmds-available-screen-pixel-height))
  (setq fr-pixel-height (x-display-pixel-height))
  (setq borders     (* 2 (cdr (assq 'border-width (frame-parameters frame)))))
  ;; Subtract borders, scroll bars, & title bar, then convert pixel sizes to char sizes.
  (setq new-height
	(- (/ (- fr-pixel-height borders
		 (frcmds-extra-pixels-height frame)
		 window-mgr-title-bar-pixel-height
		 (frcmds-smart-tool-bar-pixel-height))
	      (frame-char-height frame))
	   ;; Subtract menu bar unless on Carbon Emacs (menu bar not in the frame).
	   (if (eq window-system 'mac)
	       0
	     (cdr (assq 'menu-bar-lines (frame-parameters frame))))))
  ;;(setq frame-resize-pixelwise t)
  (set-frame-size (selected-frame) 120  new-height)
  ;;(set-frame-width (selected-frame) 120)

)

; =====================================
; popup the kill ring when pressing M-y
; =====================================

(require 'popup)
(require 'pos-tip)
(require 'popup-kill-ring)
(global-set-key "\M-y" 'popup-kill-ring)
