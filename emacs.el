
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/emacs/modules")

(load-file "~/emacs/conf/git.el")
(load-file "~/emacs/conf/theme.el")
(load-file "~/emacs/conf/global.el")
(load-file "~/emacs/conf/c-linux.el")
(load-file "~/emacs/conf/key.el")
(load-file "~/emacs/conf/gdb.el")
;(load-file "~/emacs/conf/gtags.el")
(load-file "~/emacs/conf/cscope.el")
(load-file "~/emacs/conf/vline.el")
(load-file "~/emacs/conf/hilight.el")
(load-file "~/emacs/conf/col80.el")
(load-file "~/emacs/conf/del-trailing.el")
(load-file "~/emacs/conf/linum.el")
(load-file "~/emacs/conf/ido.el")
(load-file "~/emacs/conf/compile.el")
(load-file "~/emacs/conf/lua.el")
(load-file "~/emacs/modules/rust-mode.el")
(load-file "~/emacs/modules/dts-mode.el")
(load-file "~/emacs/modules/csharp-mode.el")
(load-file "~/emacs/conf/verilog.el")
(load-file "~/emacs/modules/php-mode.el")
(load-file "~/emacs/modules/bgscript.el")
(load-file "~/emacs/modules/rename.el")
(load-file "~/emacs/modules/strace.el")
(load-file "~/emacs/modules/markdown-mode.el")
(load-file "~/emacs/conf/markdown-mode.el")
(load-file "~/emacs/modules/transpose-frame.el")
(load-file "~/emacs/modules/meson.el")
(load-file "~/emacs/modules/kivy-mode.el")
(require 'transpose-frame)
