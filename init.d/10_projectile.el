;;; Commentary: projectile
;;; Code:
(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  (add-hook 'projectile-mode-hook 'projectile-rails-on)
  )
(use-package helm-projectile
  :config
  (helm-projectile-on))
