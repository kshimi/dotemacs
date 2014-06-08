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
	      (require 'helm-config)
	      ;;(require 'helm-migemo)
	      (require 'helm-rb)
	      (require 'helm-rails)
	      (global-set-key (kbd "C-c h") 'helm-mini)
	      (helm-mode t)
	      ;;(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
	      ;;(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
	      )

	    ;; google-this
	    (when (package-installed-p 'google-this)
	      (google-this-mode t))

	    ;; key binding
	    (load-library "term/bobcat")
	    (when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))
	    
	    ))

(provide 'init-global-configs)
;;; init-global-configs.el ends here
