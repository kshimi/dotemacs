;;; Commentary: projectile
;;; Code:
(use-package projectile
  :init
  (setq projectile-completion-system 'helm)
  :config
  (projectile-global-mode)
  (add-hook 'projectile-mode-hook 'projectile-rails-on)
  (use-package helm-projectile
    :init
    (setq helm-ag-base-command "rg --vimgrep --no-heading")
    :config
    (helm-projectile-on)
    (defun helm-projectile-ag (&optional options)
      "Helm version of projectile-ag. --- for ripgrep ---"
      (interactive (if current-prefix-arg (list (read-string "option: " "" 'helm-ag--extra-options-history))))
      (if (require 'helm-ag nil t)
          (if (projectile-project-p)
              (let* ((helm-ag-command-option options)
                     (current-prefix-arg nil))
                (helm-do-ag (projectile-project-root) (car (projectile-parse-dirconfig-file))))
            (error "You're not in a project"))
        ))
    :ensure t
    )
  (use-package projectile-rails
    :ensure t)
  (use-package projectile-ripgrep
    :ensure t)
  :ensure t
  )
