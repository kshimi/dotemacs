;;; Commentary: robe
;;; Code:
(use-package robe
  :if (not (memq window-system '(w32)))
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
;;  (use-package ruby-guard :ensure t)
;;  (use-package anything-myrurema :ensure t)
  :ensure t
  )
