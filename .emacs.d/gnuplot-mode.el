;;; $Id: gnuplot-mode.el 39 2013-03-05 10:38:12Z e09485 $

;; load the file
(require 'gnuplot-mode)

;; specify the gnuplot executable (if other than /usr/bin/gnuplot)
(setq gnuplot-program "C:/usr/share/gnuplot/bin/pgnuplot")

;; automatically open files ending with .gp or .gnuplot in gnuplot mode
(setq auto-mode-alist 
(append '(("\\.\\(gp\\|gnuplot\\)$" . gnuplot-mode)) auto-mode-alist))

