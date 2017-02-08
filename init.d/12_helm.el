;;; Commentary: helm
;;; Code:
(use-package helm
  :bind (("C-x C-f" . helm-find-files)
	 ("M-x" . helm-M-x)
	 ("M-y" . helm-show-kill-ring)
	 ("C-x b" . helm-mini))
  :config
  (helm-mode 1)
  (defadvice helm-buffers-sort-transformer (around ignore activate)
    (setq ad-return-value (ad-get-arg 0)))
  (setq helm-ag-base-command "pt --nocolor --nogroup")
  (helm-migemo-mode 1)
  )
(use-package helm-config)
;	      (use-package helm-files)
;	      (use-package helm-grep)
;	      (use-package helm-rb)
;	      (use-package helm-rails)
(use-package helm-eshell
  :init
  (bind-keys :map eshell-mode-map
	     ("C-c C-l" . helm-eshell-history)
  )
(use-package helm-swoop)
(use-package helm-descbinds
  :config
  (helm-descbinds-mode))
