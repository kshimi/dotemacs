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
    :bind (("C-c C-r" . ivy-resume)))
  (use-package swiper
    :ensure t
    :init
    (defun isearch-forward-or-swiper (use-swiper)
      (interactive "P")
      (let (current-prefix-arg)
        (call-interactively (if use-swiper 'swiper 'isearch-forward))))
    :bind (("C-s" . isearch-forward-or-swiper)))
  (use-package ivy-rich
    :ensure t
    :config
    (ivy-rich-mode 1))
  )
