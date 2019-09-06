;;; Commentary: lsp-mode
;;; Code:
(use-package lsp-mode
  :ensure t
  :hook
  (python-mode . lsp)
  (ruby-mode . lsp)
  :init
  (setq lsp-enable-indentation nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-enable-on-type-formatting nil)
  :custom
  (lsp-prefer-flymake :none)
  :commands lsp)
(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package company-lsp
  :ensure t
  :commands company-lsp
  :custom
  (company-lsp-cache-candidates nil)
  (company-lsp-enable-recompletion nil))
