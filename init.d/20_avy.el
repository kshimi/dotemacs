;;; Commentary: avy
;;; Code:
(use-package avy :ensure t
  :bind
  ("M-g c" . avy-goto-char)
  ("M-g f" . avy-goto-line)
  ("M-g w" . avy-goto-word-1)
  ("M-g e" . avy-goto-word-0)
  :config (avy-setup-default))

(use-package avy-zap :ensure t
  :bind ("M-z" . avy-zap-to-char))
