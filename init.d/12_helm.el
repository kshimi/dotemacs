;;; Commentary: helm
;;; Code:
(use-package helm
  :ensure t
  :bind (("C-x C-f" . helm-find-files)
	 ("M-x" . helm-M-x)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x b" . helm-mini)
         ("M-g s" . helm-swoop))
  :config
  (require 'helm-config)
  (defadvice helm-buffers-sort-transformer (around ignore activate)
    (setq ad-return-value (ad-get-arg 0)))
  (add-hook 'eshell-mode-hook
            (lambda ()
              (eshell-cmpl-initialize)
              (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
              (define-key eshell-mode-map (kbd "C-c C-l") 'helm-eshell-history)))
  (helm-mode 1)
  (helm-migemo-mode 1)
  :init
  (use-package helm-swoop
    :ensure t)
  (use-package helm-descbinds
    :config
    (helm-descbinds-mode)
    :ensure t)
  (use-package helm-ag
    :ensure t)
  (use-package helm-projectile
    :ensure t)
  )
