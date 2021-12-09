(deftheme mytheme24 "my custom theme")
(custom-theme-set-faces
  'mytheme24
  '(default ((t (:foreground "#e5e6e7" :background "#000000"))))
  '(cursor ((t (:background "#cbc757"))))
  '(fringe ((t (:background "#242424"))))
  '(mode-line ((t (:foreground "#c2c2c2" :background "#1a1a6a"))))
  '(mode-line-inactive ((t (:foreground "#c2c2c2" :background "#4a4a4a"))))
  '(region ((t (:background "#484841"))))
  '(font-lock-builtin-face ((t (:foreground "#2e93ff"))))
  '(font-lock-comment-face ((t (:foreground "#505050"))))
  '(font-lock-function-name-face ((t (:foreground "#c00000"))))
  '(font-lock-keyword-face ((t (:foreground "#369dff"))))
  '(font-lock-string-face ((t (:foreground "#d06500"))))
  '(font-lock-type-face ((t (:foreground"#77d746"))))
  '(font-lock-constant-face ((t (:foreground "#ff8ae8"))))
  '(font-lock-variable-name-face ((t (:foreground "#dede81"))))
  '(minibuffer-prompt ((t (:foreground "#adadad" :bold t))))
  '(font-lock-warning-face ((t (:foreground "red" :bold t))))
  '(isearch ((t (:foreground "#ffffff" :background "#8a1500" :bold t))))
  '(lazy-highlight ((t (:foreground "#dfdfdf" :background "#4a4441" :bold t ))))
  '(ediff-fine-diff-C ((t (:foreground "#e5e6e7" :background "#808020" :bold t ))))
  '(ediff-current-diff-C ((t (:foreground "#eaeaea" :background "#303000" ))))
  '(ediff-fine-diff-A ((t (:foreground "#eaeaea" :background "#aa2222" ))))
  '(ediff-current-diff-A ((t (:foreground "#eaeaea" :background "#553333" ))))
  '(ediff-fine-diff-B ((t (:foreground "#eaeaea" :background "#119911" ))))
  '(ediff-current-diff-B ((t (:foreground "#eaeaea" :background "#335533" ))))
  '(ediff-odd-diff-A ((t (:foreground "#e5e6e7" :background "#000087" ))))
  '(ediff-odd-diff-B ((t (:foreground "#e5e6e7" :background "#000087" ))))
  '(ediff-odd-diff-C ((t (:foreground "#e5e6e7" :background "#000087" ))))
  '(ediff-even-diff-A ((t (:foreground "#e5e6e7" :background "#5f005f" ))))
  '(ediff-even-diff-B ((t (:foreground "#e5e6e7" :background "#5f005f" ))))
  '(ediff-even-diff-C ((t (:foreground "#e5e6e7" :background "#5f005f" ))))
  '(which-func ((t (:foreground "#f7ff57"))))
  '(header-line ((t (:background "#0e3d02"))))
  '(linum ((t (:foreground "#404040"))))
)
(provide-theme 'mytheme24)

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (load-theme 'mytheme24 t))))
)
