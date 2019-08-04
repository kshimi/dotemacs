;;; Commentary: projectile
;;; Code:
(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (use-package counsel-projectile :ensure t)
  (use-package projectile-rails
    :ensure t
    :config
    (projectile-rails-global-mode))
  (use-package projectile-ripgrep
    :ensure t)
  )
