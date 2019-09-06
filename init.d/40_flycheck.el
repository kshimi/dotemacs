(use-package flycheck
  :ensure t
  :if (not (memq window-system '(w32)))
  :init
  :config
  (global-flycheck-mode)
  )

