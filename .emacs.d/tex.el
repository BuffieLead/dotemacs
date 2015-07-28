;;
;; YaTeX
;;
;;; Initialize
(cond
 (windows-p (private-load-init "~/.emacs.d/yatex-windows.el"))
 (linux-p (private-load-init "~/.emacs.d/yatex-linux.el"))
)

(autoload 'latex-math-preview-expression "latex-math-preview" nil t)
(autoload 'latex-math-preview-insert-symbol "latex-math-preview" nil t)
(autoload 'latex-math-preview-save-image-file "latex-math-preview" nil t)
(autoload 'latex-math-preview-beamer-frame "latex-math-preview" nil t)

(add-hook 'yatex-mode-hook
         '(lambda ()
         (YaTeX-define-key "\C-p" 'latex-math-preview-expression)
;         (YaTeX-define-key "\C-p" 'latex-math-preview-save-image-file)
         (YaTeX-define-key "\C-j" 'latex-math-preview-insert-symbol)
;         (YaTeX-define-key "\C-j" 'latex-math-preview-last-symbol-again)
;         (YaTeX-define-key "\C-b" 'latex-math-preview-beamer-frame)
		 )
)
(setq latex-math-preview-in-math-mode-p-func 'YaTeX-in-math-mode-p)



