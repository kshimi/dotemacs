;; helm
(when (package-installed-p 'helm)
  (require 'helm)
  (require 'helm-config)
;	      (require 'helm-files)
;	      (require 'helm-grep)
;	      (require 'helm-rb)
;	      (require 'helm-rails)
  (require 'helm-eshell)
  (require 'helm-swoop)
  (add-hook 'eshell-mode-hook
	    #'(lambda ()
		(define-key eshell-mode-map (kbd "C-c C-l") 'helm-eshell-history)))

  (require 'helm-descbinds)
  (helm-descbinds-mode)

  (defadvice helm-buffers-sort-transformer (around ignore activate)
    (setq ad-return-value (ad-get-arg 0)))

  (setq helm-ag-base-command "pt --nocolor --nogroup")

  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (helm-mode 1)
  (helm-migemo-mode 1)
  )
