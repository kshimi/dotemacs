;;; Commentary: flymake settings
;;; Code:
(use-package flymake-diagnostic-at-point :ensure t
  :if (memq window-system '(w32))
  :hook (flymake-mode . flymake-diagnostic-at-point-mode))
