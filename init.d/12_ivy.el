;;; Commentary: ivy
;;; Code:
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (use-package counsel
    :ensure t
    :config
    (counsel-mode 1)
    :bind (("C-x C-f" . counsel-find-file)
           ("M-x" . counsel-M-x)
           ("M-y" . counsel-yank-pop)
           ("C-x C-b" . counsel-ibuffer)
           ("C-M-z" . counsel-fzf)
           ("C-M-r" . counsel-recentf)
           )
    )
  (use-package swiper
    :ensure t
    :bind (("M-g s" . swiper)))
  )
