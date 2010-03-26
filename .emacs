;setup slime extension
(setq inferior-lisp-program "/usr/bin/clisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
(require 'slime)
(slime-setup)

;; hide bars
(tool-bar-mode -1)
(menu-bar-mode -1)

; set color theme
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-select 'Arjen')
