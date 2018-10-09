;;; Commentary: magit
;;; Code:
(use-package magit
  :config
  (when (eq (window-system) 'w32)
    (setenv "GIT_ASKPASS" "git-gui--askpass")
    (add-hook 'git-commit-mode-hook
              '(lambda ()
                 (set-buffer-file-coding-system 'utf-8))))
  (global-magit-file-mode t)
  (add-hook 'eshell-mode-hook 'magit-file-mode)
  :ensure t
  )
