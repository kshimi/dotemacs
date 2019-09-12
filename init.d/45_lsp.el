;;; Commentary: lsp-mode
;;; Code:
(use-package lsp-mode
  :ensure t
  :hook
  (python-mode . lsp)
  (ruby-mode . lsp)
  :custom
  (lsp-enable-indentation nil)
  (lsp-enable-snippet nil)
  (lsp-enable-on-type-formatting nil)
  (lsp-prefer-flymake :none)
  :commands lsp)
(use-package lsp-ui
  :ensure t
  :custom
  (lsp-ui-doc-position 'bottom)
  (lsp-ui-doc-max-height 10)
  :commands lsp-ui-mode)
(use-package company-lsp
  :ensure t
  :commands company-lsp
  :custom
  (company-lsp-cache-candidates nil)
  (company-lsp-enable-recompletion nil))
