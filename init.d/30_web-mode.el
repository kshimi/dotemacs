;;; Commentary: web-mode
;;; Code:
(use-package web-mode :ensure t
  :mode
  "\\.html?\\'" "\\.erb\\'" "\\.jsp\\'" "\\.s?css\\'"
  :custom
  (web-mode-engines-alist '(("erb" . "\\.erb\\'")
                            ("jsp" . "\\.html\\'")
                            ("jsp" . "\\.jsp\\'")
                            ))
  :config
  (defun web-mode-hook ()
    ;;    (setq web-mode-markup-indent-offset 2)
    ;;    (setq web-mode-css-indent-offset 2)
    ;;    (setq wet-mode-code-indent-offset 2)
    (setq web-mode-block-padding 4))
  (add-hook 'web-mode-hook 'web-mode-hook))

