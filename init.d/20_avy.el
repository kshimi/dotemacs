;;; Commentary: avy
;;; Code:
(use-package avy
  :bind (
;	 ("C-:") . avy-goto-char)
	 ("C-'" . avy-goto-char)
	 ("M-g f" . avy-goto-line)
	 ("M-g w" . avy-goto-word-1)
	 ("M-g e" . avy-goto-word-0))
  :config
  (avy-setup-default)
  (use-package avy-zap
    :bind (("M-z" . avy-zap-to-char))
    :ensure t
    )
  :ensure t
  )
