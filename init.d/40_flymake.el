;;; Commentary: flymake settings
;;; Code:
(use-package flymake-diagnostic-at-point
  :ensure t
  :hook
  (flymake-mode . flymake-diagnostic-at-point-mode))
