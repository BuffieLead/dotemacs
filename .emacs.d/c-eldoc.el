;;; c-eldoc.el --- 

(require 'eldoc)
(require 'eldoc-extension)
;(require 'c-eldoc)

(setq eldoc-idle-delay 0)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;(setq c-eldoc-cpp-command "cpp ")
;(setq c-eldoc-includes "-I\"C:/Program Files (x86)/Microsoft Visual Studio 11.0/VC/INCLUDE\" -I\"C:/Program Files (x86)/Microsoft Visual Studio 11.0/VC/ATLMFC/INCLUDE\" -I\"C:/Program Files (x86)/Windows Kits/8.0/include/shared/\" -I\"C:/Program Files (x86)/Windows Kits/8.0/include/um/\" -I\"C:/Program Files (x86)/Windows Kits/8.0/include/winrt\" -I./ -I../")
;(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
;(add-hook 'c++-mode-hook
;  (lambda ()
;    (set (make-local-variable 'eldoc-idle-delay) 0.20)
;      (c-turn-on-eldoc-mode)
;))

;;; c-eldoc.el ends here
