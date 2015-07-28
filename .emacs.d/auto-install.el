;; auto-install config
;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-
;; $Id: auto-install.el 123 2015-03-19 04:46:09Z e09485 $

;(require 'package)
;(setq package-user-dir "~/.emacs.d/elisp/package/")
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;(package-initialize)

; melpa.el
;(require 'melpa)

(require 'auto-install)
; download dir
(setq auto-install-directory "~/.emacs.d/elisp/auto-install/")

; install-elisp compatibility
(auto-install-compatibility-setup)

; donwload method
(setq auto-install-use-wget nil)

; proxy setting
;(setq url-proxy-services '(("http" . "g3.konicaminolta.jp:8080")))


