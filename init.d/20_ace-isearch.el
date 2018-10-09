;;; Commentary: ace-isearch
;;; Code:
(use-package ace-isearch
  :config
  (global-ace-isearch-mode +1)
  (setq ace-isearch-function 'avy-goto-char)
  (setq ace-isearch-use-jump 'printing-char)
  :ensure t
  )
