;;; Commentary: flymake settings
;;; Code:
(use-package flymake-diagnostic-at-point
  :if (memq window-system '(w32))
  :ensure t
  :hook
  (flymake-mode . flymake-diagnostic-at-point-mode))
