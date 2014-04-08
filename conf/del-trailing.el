(add-hook 'prog-mode-hook
      '(lambda ()
         (add-hook 'before-save-hook
                   (lambda ()
                     (delete-trailing-whitespace)))))
