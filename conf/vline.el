(require 'vline)

;; ------- current col hilight -----------
(setq vline-use-timer t)
(setq vline-idle-time 0.4)

;;(setq vline-style 'compose) ;; compose brokes vertial font size
(defface my-vline-face
  '((t (:background "#151515")))
  "A default face for vertical line highlighting in visual lines."
  :group 'vline)

;; don't touch background here
(defface my-vline-visual-face
  '((t ()))
  "A default face for vertical line highlighting in visual lines."
  :group 'vline)

;; wrapped rows are draw differently
(setq vline-face 'my-vline-face)
;; face for wrapped rows
(setq vline-visual-face 'my-vline-visual-face)

;; ------ set face for 80 col highligh -------------------------
(setq column-marker-1-face 'my-warning-face)



(add-hook 'prog-mode-hook 'vline-mode)
