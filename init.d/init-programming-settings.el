;;; init-programming-settings.el --- ruby configulations

;;; Commentary:
;;; Code:

(add-hook 'after-init-hook
	  (lambda ()

	    (global-flycheck-mode t)

	    (require 'init-ruby)
	    ))

(provide 'init-programming-settings)
;;; init-programming-settings.el ends here

