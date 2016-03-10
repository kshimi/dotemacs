;; avy
(when (package-installed-p 'avy)
  (avy-setup-default)
  (require 'avy-zap)
  (global-set-key (kbd "M-z") 'avy-zap-up-to-char))
