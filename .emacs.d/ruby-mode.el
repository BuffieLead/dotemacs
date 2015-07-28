;;; ruby-mode initialize
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(autoload 'rdoc-mode "rdoc-mode" "Mode for editing rdoc files" t)
(add-to-list 'auto-mode-alist  '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist  '("\\.rbw$" . ruby-mode))
(add-to-list 'auto-mode-alist  '("\\.rdoc$" . rdoc-mode))

(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))
(setq ruby-insert-encoding-magic-comment nil)

;; ruby-electric.el --- electric editing commands for ruby files
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)
