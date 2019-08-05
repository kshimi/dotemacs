;;; Commentary: ivy
;;; Code:
(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t)
  :config
  (ivy-mode 1)
  (use-package counsel
    :ensure t
    :config
    (counsel-mode 1)
    :bind (("C-x C-b" . counsel-ibuffer)
           ("C-c C-r" . ivy-resume)
           )
    )
  (use-package swiper
    :ensure t
    :bind (("M-g s" . swiper)))
  )
