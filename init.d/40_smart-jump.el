;;; Commentary: smart-jump
;;; Code:
(use-package smart-jump
  :ensure t
  :config
  (smart-jump-register
   :modes 'python-mode
   :jump-fn 'lsp-ui-peek-find-definitions
   :refs-fn 'lsp-ui-peek-find-references
   :heuristic 'point
   :order 1
   )
  )
