(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config (with-eval-after-load 'flycheck
	    (flycheck-pos-tip-mode)))

