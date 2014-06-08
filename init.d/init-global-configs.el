;;; init-global-configs.el --- global configulations

;;; Commentary:
;;; Code:

(tool-bar-mode nil)
(show-paren-mode t)

(add-hook 'after-init-hook
	  (lambda()
	    
	    (when (package-installed-p 'exec-path-from-shell)
	      (when (memq window-system '(mac ns))
		(exec-path-from-shell-initialize)))

	    (when (package-installed-p 'google-this)
	      (google-this-mode t))

	      


;;; key binding
	    (load-library "term/bobcat")
	    (when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))
	    
	    ))


(provide 'init-global-configs)
;;; init-global-configs.el ends here
