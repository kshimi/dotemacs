;; auto-install
(when (package-installed-p 'auto-install)
  (require 'auto-install)
  (auto-install-update-emacswiki-package-name t)
  (add-to-list 'load-path "~/.emacs.d/auto-install")
  )
