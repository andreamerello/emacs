(require 'highlight-chars)

(defface my-warning-hcface '((t (:background "#900000")))
  "Face used for a column marker.  Usually a background color."
  :group 'faces)

;; ------ tabs & other special chars hilight stuff  ------------
;(setq highlight-tabs 1)
;(setq highlight-trailing-whitespace 1)
;(setq trailing-whitespace 'my-warning-face)

(defface hc-trailing-whitespace '((t (:inherit 'my-warning-hcface)))
  "Face used for a column marker.  Usually a background color."
  :group 'Highlight-Characters :group 'faces)

(defface hc-tab '((t (:background "#505000")))
  "*Face for highlighting tab characters (`C-i') in Font-Lock mode."
  :group 'Highlight-Characters :group 'faces)


(defun my-show-tabs ()
  (interactive)
  ; (standard-display-ascii ?\t "^I"))
  (hc-toggle-highlight-tabs))

(add-hook 'prog-mode-hook 'hc-highlight-trailing-whitespace)
