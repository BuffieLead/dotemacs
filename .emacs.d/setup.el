;;; function.el --- basic functions

;; Copyright (C) 2013  

;; Author:  $Id: setup.el 123 2015-03-19 04:46:09Z e09485 $
;;; Commentary:

;;; 
(defun x->bool (elt) (not (not elt)))
(defvar emacs22-p (equal emacs-major-version 22))
(defvar emacs23-p (equal emacs-major-version 23))
(defvar emacs24-p (equal emacs-major-version 24))
(defvar darwin-p (eq system-type 'darwin))
(defvar ns-p (featurep 'ns))
(defvar carbon-p (and (eq window-system 'mac) emacs22-p))
(defvar mac-p (and (eq window-system 'mac) (or emacs23-p emacs24-p)))
(defvar linux-p (eq system-type 'gnu/linux))
(defvar colinux-p (when linux-p
                    (let ((file "/proc/modules"))
                      (and
                       (file-readable-p file)
                       (x->bool
                        (with-temp-buffer
                          (insert-file-contents file)
                          (goto-char (point-min))
                          (re-search-forward "^cofuse\.+" nil t)))))))
(defvar cygwin-p (eq system-type 'cygwin))
(defvar nt-p (eq system-type 'windows-nt))
(defvar meadow-p (featurep 'meadow))
(defvar windows-p (or cygwin-p nt-p meadow-p))

;; instant defun
(defun private-load-init (file)
  (load (expand-file-name file))
)
(defun private-clean-file (file)
  (if
      (file-exists-p (expand-file-name file))
      (delete-file (expand-file-name file))
    )
)

(defun local-load-init (x)
	 (if (file-exists-p (expand-file-name  x))
		 (private-load-init x)))


;;; function.el ends here
