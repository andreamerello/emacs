
;; --------- hilight pharentesys in code
(show-paren-mode 1)

;; when compiling scroll down
;(setq compilation-scroll-output 1)

(defun my-indent-linux ()
  (interactive)
  (setq indent-tabs-mode t)
  (c-set-style "linux-tabs-only")
)

(defun my-indent-2 ()
  (interactive)
  ;;(setq c-basic-indent 2)
  (setq c-basic-offset 2)
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
					;(setq indent-line-function 'insert-tab)
)

(defun my-indent-4 ()
  (interactive)
  ;;(setq c-basic-indent 2)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
					;(setq indent-line-function 'insert-tab)
)

(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
	  (column (c-langelem-2nd-pos c-syntactic-element))
	   (offset (- (1+ column) anchor))
	    (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only
			 (arglist-close . c-lineup-close-paren))))
 	    ; default to kernel style
	     (setq c-default-style "linux-tabs-only"))))

; default to kernel style
(setq indent-tabs-mode t)
