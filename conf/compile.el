(defun my-kill-compiler-output ()
    "kill compile window if anyy"
    (interactive)
    (progn
      (if (get-buffer "*compilation*") ; If old compile window exists
  	(progn
  	  (delete-windows-on (get-buffer "*compilation*")) ; Delete the compilation windows
  	  (kill-buffer "*compilation*") ; and kill the buffers
  	  )
        )
      )
  )

(defun my-next-error ()
    "Move point to next error and highlight it"
    (interactive)
    (progn
      (next-error)
      (end-of-line-nomark)
      (beginning-of-line-mark)
      )
  )

  (defun my-previous-error ()
    "Move point to previous error and highlight it"
    (interactive)
    (progn
      (previous-error)
      (end-of-line-nomark)
      (beginning-of-line-mark)
      )
  )
