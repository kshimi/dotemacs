;;; Commentary: company
;;; Code:
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (set-face-attribute 'company-tooltip nil
                      :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common nil
                      :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common-selection nil
                      :foreground "white" :background "steelblue")
  (set-face-attribute 'company-tooltip-selection nil
                      :foreground "black" :background "steelblue")
  (set-face-attribute 'company-preview-common nil
                      :background nil :foreground "lightgrey" :underline t)
  (set-face-attribute 'company-scrollbar-fg nil
                      :background "orange")
  (set-face-attribute 'company-scrollbar-bg nil
                      :background "gray40")
  :init
  (use-package company-quickhelp :ensure t :config (company-quickhelp-mode +1))
  )