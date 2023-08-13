(defun my-prog-mode-save-hook ()
  (if (not (equal major-mode 'diff-mode))
      (delete-trailing-whitespace)
  )
)

(add-hook 'prog-mode-hook
	  '(lambda ()
	     (add-hook 'before-save-hook 'my-prog-mode-save-hook)))
