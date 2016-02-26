;; magit
(when (package-installed-p 'magit)
  (require 'magit)
  (when (eq (window-system) 'w32)
    (setenv "GIT_ASKPASS" "git-gui--askpass"))
  (global-magit-file-mode t)
  (add-hook 'eshell-mode-hook 'magit-file-mode)
  )
