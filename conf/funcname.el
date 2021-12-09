;; Show the current function name in the header line
(which-function-mode)

(defun my-funcmode-on ()
  (setq header-line-format
              '((which-func-mode ("" which-func-format " "))))
)

(defun my-funcmode-off ()
  ;;(makunbound 'header-line-format)
)

(defun my-funcmode-hook ()
  (if (or (or (eq major-mode 'c++-mode) (eq major-mode 'c-mode)) (eq major-mode 'python-mode))
      (my-funcmode-on)
    (my-funcmode-off))
)
;;(add-to-list 'which-func-modes 'c-mode)
;;(add-to-list 'which-func-modes 'c++-mode)
;;(add-to-list 'which-func-modes 'python-mode)

(add-hook 'after-change-major-mode-hook 'my-funcmode-hook)

;(add-hook 'c-mode-common-hook 'my-funcmode-hook)
;(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)
;(add-hook 'python-mode-common-hook 'my-c-mode-common-hook)


(setq mode-line-misc-info
            ;; We remove Which Function Mode from the mode line, because it's mostly
            ;; invisible here anyway.
            (assq-delete-all 'which-func-mode mode-line-misc-info))
(setq which-func-unknown "n/a")
