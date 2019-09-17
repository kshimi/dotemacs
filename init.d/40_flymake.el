;;; Commentary: flymake settings
;;; Code:
(use-package flymake-diagnostic-at-point :ensure t
  :if (memq system-type '(windows-nt))
  :hook (flymake-mode . flymake-diagnostic-at-point-mode))
