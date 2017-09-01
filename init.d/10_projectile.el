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
  (helm-projectile-on)
  (setq helm-ag-base-command "rg --vimgrep --no-heading")
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
  )
