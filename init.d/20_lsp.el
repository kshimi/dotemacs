;;; Commentary: lsp-mode
;;; Code:
(use-package lsp-mode
  :ensure t
  :hook
  (python-mode . lsp)
  (ruby-mode . lsp)
  :commands lsp)

(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package company-lsp :ensure t :commands company-lsp)
(use-package helm-lsp :ensure t :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)
