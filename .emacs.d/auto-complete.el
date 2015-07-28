(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'ac-dictionary-directories (expand-file-name "~/etc/ac-dict/"))
(setq ac-comphist-file "~/etc/ac-comphist.dat")
(global-set-key "\M-/" 'ac-start)
;; C-n/C-p で候補を選択
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
