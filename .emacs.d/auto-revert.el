;; auto-revert
;; $Id: auto-revert.el 17 2013-02-12 06:49:39Z e09485 $


(add-hook 'window-configuration-change-hook
   (lambda ()
     (run-with-timer 0.5
        nil
        (lambda ()
           (unless (verify-visited-file-modtime (current-buffer))
               (revert-buffer t t))))))
