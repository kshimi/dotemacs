;; helm
(when (package-installed-p 'helm)
  (require 'helm)
  (require 'helm-config)
;	      (require 'helm-config)
;	      (require 'helm-eshell)
;	      (require 'helm-files)
;	      (require 'helm-grep)
	      ;;(require 'helm-migemo)
;	      (require 'helm-rb)
;	      (require 'helm-rails)
;	      (global-set-key (kbd "C-c h") 'helm-mini)
  (require 'helm-eshell)
  (add-hook 'eshell-mode-hook
	    #'(lambda ()
		(define-key eshell-mode-map (kbd "C-c C-l") 'helm-eshell-history)))

  (defadvice helm-buffers-sort-transformer (around ignore activate)
    (setq ad-return-value (ad-get-arg 0)))

  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (helm-mode 1)
  )
