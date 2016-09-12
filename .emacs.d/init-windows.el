; $Id: init-windows.el 120 2015-03-13 18:00:47Z Toshiyuki $
;;; Language Environment
(set-language-environment  'utf-8)
(set-default-coding-systems 'japanese-shift-jis-dos)
(set-w32-system-coding-system 'sjis-dos)
(prefer-coding-system 'sjis-dos)
(setq default-file-name-coding-system 'japanese-cp932-dos)
(setq default-keyboard-coding-system 'japanese-cp932)
(setq default-buffer-file-coding-system 'cp932)
(setq default-process-coding-system '(cp932 . cp932))
(set-charset-priority 'ascii 'japanese-jisx0208 'latin-jisx0201
                      'katakana-jisx0201 'iso-8859-1 'cp1252 'unicode)
(set-coding-system-priority 'utf-8 'euc-jp 'iso-2022-jp 'cp932)

;;; Input Method
(setq default-input-method "W32-IME")
(setq-default w32-ime-mode-line-state-indicator "[--]")
(setq w32-ime-mode-line-state-indicator-list '("[--]" "[Ja]" "[--]"))
(w32-ime-initialize) 
(setq ime-activate-cursor-color "Gray") 
(setq ime-inactivate-cursor-color "Gray") 
(set-cursor-color ime-inactivate-cursor-color) 
(add-hook 'w32-ime-on-hook 
          (function (lambda () 
                      (set-cursor-color ime-activate-cursor-color)))) 
(add-hook 'w32-ime-off-hook 
          (function (lambda () 
                      (set-cursor-color ime-inactivate-cursor-color)))) 

;; Window Settings
;(add-to-list
; 'default-frame-alist
; '(alpha . (0.85 0.80))
										; )
(let ((target 'default-frame-alist)
      (list
	   '((alpha . (0.85 0.80))
		 (foreground-color . "White")
		 (background-color . "Black")
		 (cursor-color . "Gray")
		 (mouse-color . "Gray"))
	   ))
  (mapcar (lambda (elm) (add-to-list target elm)) list))

;------------------
;フォント設定
;1234567890
(cond
 (window-system
  (setq w32-enable-synthesized-fonts t)
  (setq scalable-fonts-allowed t)
  (setq-default line-spacing 2)
 ; (set-default-font "Inconsolata-13")
 ; (set-face-font 'variable-pitch "Inconsolata-13")
  (set-face-attribute 'default nil
    :family "Courier New"
 ;   :family "Inconsolata"
    :height 100
  )
;  (setq mydef-font (font-spec :family "Meiryo" :size 11))
;  (create-fontset-from-ascii-font "VL Gothic" nil " VL Gothic") 

  (setq mydef-font (font-spec :family "Meiryo" :size 11))
;  (setq mydef-font (font-spec :family "Source Sans Pro Black" :size 11))
; '("Meiryo" . "unicode-bmp")

  ;; Japanese(japanese-jisx0208)font
  (set-fontset-font
   (frame-parameter nil 'font)
   'japanese-jisx0208
   mydef-font
   )
  (set-fontset-font
   (frame-parameter nil 'font)
   'japanese-jisx0212
   mydef-font
   )
  (set-fontset-font
   (frame-parameter nil 'font)
   'cp932-2-byte
   mydef-font
   )
  (set-fontset-font
   (frame-parameter nil 'font)
   'cp932
   mydef-font
   )
  (set-fontset-font 
   (frame-parameter nil 'font)
   'katakana-jisx0201 
   mydef-font
   )
  (set-background-color "Black")
  (set-foreground-color "White")
  (set-cursor-color "Gray")
  )
 )

;;; printer
(require 'cl)

(setq
 ps-print-color-p t
; ghostscriptの実行コマンド場所を指定
 ps-lpr-command "gswin64c.exe"
 ps-multibyte-buffer 'non-latin-printer
 ps-lpr-switches '("-sDEVICE=mswinpr2" "-dNOPAUSE" "-dBATCH" "-dWINKANJI" "-dBitsPerPixel=24")
 printer-name nil
 ps-printer-name nil
 ps-printer-name-option nil
 ps-print-header t          ; ヘッダの非表示
)

;;; doc-view
(setq  doc-view-ghostscript-program "gswin64c.exe")

;;; exec-path
(add-to-list 'exec-path 
			 (expand-file-name "~/bin/win32/"))
(setenv "PATH" (mapconcat 'identity exec-path ";"))
