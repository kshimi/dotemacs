;;; Commentary: auto-install
;;; Code:
(use-package auto-install
  :if (not (memq window-system '(w32)))
  :config
  (add-to-list 'load-path "~/.emacs.d/auto-install")
  (auto-install-update-emacswiki-package-name t)
  :ensure t
  )
