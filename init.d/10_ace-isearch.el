;;; Commentary: ace-isearch
;;; Code:
(use-package ace-isearch
  :config
  (global-ace-isearch-mode +1)
  (custom-set-variables
   '(ace-isearch-function 'avy-goto-char)
   '(ace-isearch-use-jump 'printing-char))
  :ensure t
  )
