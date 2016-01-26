;; magit
(when (package-installed-p 'magit)
  (require 'magit)
  (global-magit-file-mode t)
  (add-hook 'eshell-mode-hook 'magit-file-mode)
  )
