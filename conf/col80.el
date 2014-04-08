;; for col 80 mark
(require 'column-marker)

;; ------ face for all warnings (trailing whitespace, > 80 cols.. 
(defface my-warning-80face '((t (:background "#900000")))
  "Face used for a column marker.  Usually a background color."
  :group 'faces)

(setq column-marker-1-face 'my-warning-80face)

(add-hook 'prog-mode-hook (lambda() (interactive) (column-marker-1 80)))
