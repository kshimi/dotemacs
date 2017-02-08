;;; Commentary: magit
;;; Code:
(use-package magit
  :config
  (when (eq (window-system) 'w32)
    (setenv "GIT_ASKPASS" "git-gui--askpass"))
  (global-magit-file-mode t)
  (add-hook 'eshell-mode-hook 'magit-file-mode)
  )
