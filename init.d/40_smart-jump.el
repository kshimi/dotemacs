;;; Commentary: smart-jump
;;; Code:
(use-package smart-jump :ensure t
  :config
  (smart-jump-register
   :modes 'lsp-ui-mode
   :jump-fn 'lsp-ui-peek-find-definitions
   :pop-fn nil
   :refs-fn 'lsp-ui-peek-find-references
   :heuristic 'error))
