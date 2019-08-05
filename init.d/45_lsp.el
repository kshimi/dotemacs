;;; Commentary: lsp-mode
;;; Code:
(use-package lsp-mode
  :ensure t
  :hook
  (python-mode . lsp)
  (ruby-mode . lsp)
  :custom
  (lsp-prefer-flymake 'flymake)
  :commands lsp)

(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package company-lsp :ensure t :commands company-lsp)
