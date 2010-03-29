(setq make-backup-files nil) 
(setq auto-save-default nil)


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
(color-theme-select 'Arjen)

;;(autoload 'wl "wl" "Wanderlust" t)
;(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
;(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

