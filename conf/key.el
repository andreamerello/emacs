; ---------------------- key bindings ---------------------
(global-set-key [(meta down)] 'scroll-up-line)
(global-set-key [(meta up)] 'scroll-down-line)
(global-set-key [(ctrl .)] 'gtags-find-rtag)

(global-set-key [(control meta up)] 'enlarge-window)
(global-set-key [(control meta down)] 'shrink-window)
(global-set-key [(control meta right)] 'enlarge-window-horizontally)
(global-set-key [(control meta left)] 'shrink-window-horizontally)

(global-set-key (kbd "M-n") 'my-next-error)
(global-set-key (kbd "M-p") 'my-previous-error)
(global-set-key (kbd "C-c k") 'my-kill-compiler-output)
;; TODO find a good key
;;(global-set-key [f8] 'gtags-show-callers)
