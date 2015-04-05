;; rbenv
(when (package-installed-p 'rbenv)
  (setq rbenv-installation-dir "~/.rbenv")
  (require 'rbenv)
  (global-rbenv-mode)
  )
