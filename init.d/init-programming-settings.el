;;; init-programming-settings.el --- ruby configulations

;;; Commentary:
;;; Code:

(add-hook 'after-init-hook
	  (lambda ()

	    (setq electric-indent-disable-modes-list
		  '(sql-mode
		    ))

	    (global-flycheck-mode t)

	    (setq scss-compile-at-save nil)

	    (require 'rubocop)
	    (require 'init-ruby)
	    ))

(provide 'init-programming-settings)
;;; init-programming-settings.el ends here

