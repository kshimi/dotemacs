;; projectile
(when (package-installed-p 'helm-projectile)
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  (helm-projectile-on)
  (add-hook 'projectile-mode-hook 'projectile-rails-on)
  )
