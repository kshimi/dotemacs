;;; Commentary: web-mode
;;; Code:
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

  (setq web-mode-engines-alist
	'(("erb" . "\\.erb\\'"))
	)

  (defun web-mode-hook ()
    ;;    (setq web-mode-markup-indent-offset 2)
    ;;    (setq web-mode-css-indent-offset 2)
    ;;    (setq wet-mode-code-indent-offset 2)
    (setq web-mode-block-padding 4)
    )
  (add-hook 'web-mode-hook 'web-mode-hook)
  :ensure t
  )

