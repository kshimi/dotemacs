;;; Commentary: rbenv
;;; Code:
(use-package rbenv
  :if (not (memq window-system '(w32)))
  :init
  (setq rbenv-installation-dir "~/.rbenv")
  :config
  (global-rbenv-mode)
  :ensure t
  )
