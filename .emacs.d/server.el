;; Emacs Server
;; $Id: server.el 45 2013-03-06 07:33:05Z e09485 $

(require 'server)
(unless (server-running-p)
  (server-start))
(remove-hook
 'kill-buffer-query-functions
 'server-kill-buffer-query-function)

