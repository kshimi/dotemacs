(use-package flycheck
  :ensure t
  :if (not (memq window-system '(w32)))
  :init
  (use-package flycheck-pos-tip :ensure t)
  (use-package helm-flycheck :ensure t
    :config
    (eval-after-load 'flycheck
      '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck)))
  :config
  (global-flycheck-mode)
  (with-eval-after-load 'flycheck
    (flycheck-pos-tip-mode))
  )

