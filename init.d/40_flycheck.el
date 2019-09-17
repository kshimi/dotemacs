(use-package flycheck :ensure t
  :if (not (memq system-type '(windows-nt)))
  :config (global-flycheck-mode))

