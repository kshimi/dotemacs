;;; Commentary: auto-install
;;; Code:
(use-package auto-install
  :config
  (add-to-list 'load-path "~/.emacs.d/auto-install")
  (auto-install-update-emacswiki-package-name t)
  )
