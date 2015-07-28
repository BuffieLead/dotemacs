;; space
;; $Id: space.el 97 2014-06-06 02:45:18Z e09485 $

(setq-default tab-width 4)
(setq default-tab-width 4)

(global-whitespace-mode 1)
(require 'whitespace)

(setq whitespace-style
      '(tabs tab-mark spaces space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))

(set-face-foreground 'whitespace-newline "gray40")
(set-face-foreground 'whitespace-space "LightSlateGray")
(set-face-background 'whitespace-space 'nil)
(set-face-foreground 'whitespace-tab "LightSlateGray")
(set-face-background 'whitespace-tab 'nil)

