;; I don't know what this does exactly.
;; One day, suddenly, tramp mode became very very slow to connect.

;; I set emacs tramp in debug mode (setq tramp-verbose 10) and I got a buffer
;; with the log; then I googled.
;; It seems that emacs tries to do ssh to 0.0.0.1 which takes a lot to timeout,
;; then it seems to run ssh again (with proper options, I guess) and it works..


(customize-set-variable 'tramp-use-ssh-controlmaster-options nil)
