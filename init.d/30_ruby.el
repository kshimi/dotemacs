;;; Commentary: robe
;;; Code:
(use-package robe
  :ensure t
  :config
  (add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (robe-mode)
               (robe-ac-setup)
               ))
  (setq inf-ruby-default-implementation "pry")
  (setq inf-ruby-eval-binding "Pry.toplevel_binding")
  (use-package ac-robe)
  (use-package inf-ruby :ensure t)
  (use-package ac-inf-ruby
    :ensure t
    :config
    (eval-after-load 'auto-complete
      '(add-to-list 'ac-modes 'inf-ruby-mode))
    (add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)
    )
  (use-package helm-rdefs :ensure t)
;;  (use-package ruby-guard :ensure t)
;;  (use-package anything-myrurema :ensure t)
  )
