;;; init-global-configs.el --- global configulations

;;; Commentary:
;;; Code:
(show-paren-mode t)

(add-hook 'after-init-hook
	  (lambda ()

	    ;; Mac OS X specific settings
	    (when (package-installed-p 'exec-path-from-shell)
	      (when (memq window-system '(mac ns))
		(exec-path-from-shell-initialize)))

	    ;; helm
	    (when (package-installed-p 'helm)
	      (setq helm-command-prefix-key "C-c h")

	      (require 'helm-config)
	      (require 'helm-eshell)
	      (require 'helm-files)
	      (require 'helm-grep)
	      ;;(require 'helm-migemo)
;	      (require 'helm-rb)
;	      (require 'helm-rails)
;	      (global-set-key (kbd "C-c h") 'helm-mini)
	      (global-set-key (kbd "M-y") 'helm-show-kill-ring)
	      (global-set-key (kbd "C-x b") 'helm-mini)
	      (helm-mode 1)
	      )

	    (when (package-installed-p 'projectile)
	      (projectile-global-mode)
	      )

	    ;; google-this
	    (when (package-installed-p 'google-this)
	      (google-this-mode t))

	    ;; auto-complete
;	    (ac-config-default)

	    ;; key binding
	    (load-library "term/bobcat")
	    (when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))
	    
	    ))

(provide 'init-global-configs)
;;; init-global-configs.el ends here
