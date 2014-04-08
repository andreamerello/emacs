
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
