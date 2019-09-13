;;; Commentary: rbenv
;;; Code:
(use-package rbenv :ensure t
  :if (not (memq window-system '(w32)))
  :custom
  (rbenv-installation-dir "~/.rbenv")
  (rbenv-show-active-ruby-in-modeline nil)
  :config
  (global-rbenv-mode)
  )
