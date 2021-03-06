;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-
;;; Emacs init file
;;; $Id: init.el 123 2015-03-19 04:46:09Z e09485 $

;;; Startup
(setq inhibit-startup-message t)
(load (expand-file-name "~/.emacs.d/setup.el"))
;;; Path
;; load-path
(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
(setq Info-default-directory-list
      (cons (expand-file-name "~/doc/info") Info-default-directory-list ))

;;; Initialize
(cond
  (windows-p (private-load-init "~/.emacs.d/init-windows.el"))
  (linux-p (private-load-init "~/.emacs.d/init-linux.el"))
)

;;; misc
(tool-bar-mode 0)
(global-auto-revert-mode 1)
(setq create-lockfiles nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix "~/etc/auto-save-list")
(setq compilation-scroll-output t)
(setq abbrev-file-name (expand-file-name "~/etc/abbrev_defs"))
(setq image-dired-dir (expand-file-name "~/etc/image-dired"))
(local-load-init "~/local.el")
(setq default-directory (expand-file-name "~/"))

;; c++-mode
(private-load-init "~/.emacs.d/c++-mode.el")

;; line number
(private-load-init "~/.emacs.d/line.el")

;; Server
(private-load-init "~/.emacs.d/server.el")

;; Tab barmode
(private-load-init "~/.emacs.d/tabbar.el")

;; View space
(private-load-init "~/.emacs.d/space.el")

;; svn
(private-load-init "~/.emacs.d/svn.el")

;; auto-revert
(private-load-init "~/.emacs.d/auto-revert.el")

;; insert
(private-load-init "~/.emacs.d/insert.el")

;; auto-install
(private-load-init "~/.emacs.d/auto-install.el")

;; bat-mode
(private-load-init "~/.emacs.d/bat-mode.el")

;; gnuplot-mode
(private-load-init "~/.emacs.d/gnuplot-mode.el")

;; keymaps
(private-load-init "~/.emacs.d/keymap.el")

;; ido-mode
(private-load-init "~/.emacs.d/ido.el")

;; flymake-mode
(private-load-init "~/.emacs.d/flymake.el");

;; csharp-mode
(private-load-init "~/.emacs.d/csharp-mode.el")

;; TeX
(private-load-init "~/.emacs.d/tex.el")

;; Haskell-mode
(private-load-init "~/.emacs.d/haskell-mode.el")

;; Ruby-mode
(private-load-init "~/.emacs.d/ruby-mode.el")

;; CMake-mode
(private-load-init "~/.emacs.d/cmake-mode.el")

;; auto-complete
(private-load-init "~/.emacs.d/auto-complete.el")

;; c-eldoc mode
(private-load-init "~/.emacs.d/c-eldoc.el")

;; vbnet-mode
(private-load-init "~/.emacs.d/visual-basic-mode.el")

;; markdown-mode
(private-load-init "~/.emacs.d/markdown-mode.el")

;; puml-mode
(private-load-init "~/.emacs.d/puml-mode.el")

;; magit
;(private-load-init "~/.emacs.d/magit.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit puml-mode)))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;(when
;	(load
;	 (expand-file-name "~/.emacs.d/elpa/package.el"))
;  (package-initialize))
