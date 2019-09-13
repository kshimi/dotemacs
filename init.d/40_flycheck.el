(use-package flycheck :ensure t
  :if (not (memq window-system '(w32)))
  :config (global-flycheck-mode))

