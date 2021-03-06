;;; Commentary: magit
;;; Code:
(use-package magit :ensure t
  :pin melpa
  :config
  (setq vc-handled-backends nil)
  (when (memq system-type '(windows-nt))
    (setenv "GIT_ASKPASS" "git-gui--askpass")
    (add-hook 'git-commit-mode-hook
              '(lambda ()
                 (set-buffer-file-coding-system 'utf-8))))
  (global-magit-file-mode t)
  (add-hook 'eshell-mode-hook 'magit-file-mode)
  )
