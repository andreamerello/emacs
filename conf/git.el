; ------ disable vc-git
(setq vc-handled-backends ())

(defun my-git()
  "Turn on git mode"
  (interactive)
  (require 'vc-git)
  (add-to-list 'vc-handled-backends 'git))
