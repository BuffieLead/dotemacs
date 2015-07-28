;; Sample file for the new session/process stuff
;; Based on my own configuration. Well, it IS my configuration.
;;
;; NOTE: If you don't have cabal-dev, or you don't want to use it, you
;; should change haskell-process-type (see below) to 'ghci.
;;
;; To merely TRY this mode (and for debugging), do the below:
;;
;;     cd into haskell-mode's directory, and run
;;     $ emacs --load examples/init.el
;;
;; To get started, open a .hs file in one of your projects, and hit…
;;
;;   1. F5 to load the current file (and start a repl session), or
;;   2. C-` to just start a REPL associated with this project, or
;;   3. C-c C-c to build the cabal project (and start a repl session).
(require 'haskell-mode)
(require 'haskell-cabal)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))
