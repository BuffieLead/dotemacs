;; $Id: init-linux.el 113 2014-08-04 03:09:15Z yamasita $

; 日本語をデフォルトにする。
(set-language-environment 'utf-8)
; japanese-anthy をデフォルトの input-method にする。
;(setq default-input-method "japanese-anthy")
(require 'mozc)
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'overlay)

(cond
 (window-system
  (add-to-list 'default-frame-alist '(alpha . (0.85 0.80)))
  (set-background-color "Black")
  (set-foreground-color "White")
  (set-cursor-color "Gray")
 )
)
