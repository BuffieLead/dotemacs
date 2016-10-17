;; auto-install config
;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-
;; $Id: auto-install.el 123 2015-03-19 04:46:09Z e09485 $

(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/package/")
(package-initialize)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; MELPA-stableを追加
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Orgを追加
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

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


