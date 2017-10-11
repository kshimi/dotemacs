(use-package flycheck
  :init
  (use-package flycheck-pos-tip
    :ensure t)
  :config
  (global-flycheck-mode)
  (with-eval-after-load 'flycheck
    (flycheck-pos-tip-mode))
  :ensure t
  )

