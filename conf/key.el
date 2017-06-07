;;---------------------- key bindings ---------------------

;; add minor mode insted of using directly things like
;; (global-set-key "\C-l\C-l" 'redraw-display)
;; so that
;; 1 - key bindings can be enabled/disabled in one shot by enabling/disabling
;;     the minor mode
;; 2 - key bindings take precedence over key bindings in other minor mode
;;     (es C-o in compiler ouput buffer)
;;
;; http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs

(global-set-key [(control x) (p)]
		(function (lambda () (interactive)
			    (insert "import pdb;pdb.set_trace()"))))

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [(meta down)] 'scroll-up-line)
    (define-key map [(meta up)] 'scroll-down-line)

    (define-key map [(control meta up)] 'enlarge-window)
    (define-key map [(control meta down)] 'shrink-window)
    (define-key map [(control meta right)] 'enlarge-window-horizontally)
    (define-key map [(control meta left)] 'shrink-window-horizontally)

    (define-key map (kbd "C-o") 'other-window)

    (define-key map (kbd "M-n") 'my-next-error)
    (define-key map (kbd "M-p") 'my-previous-error)
    (define-key map (kbd "C-c k") 'my-kill-compiler-output)

;; TODO find a good key
;;(define-key map [f8] 'gtags-show-callers)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)

;; disable my custom key bindings in the minibuffer
;;
(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)
