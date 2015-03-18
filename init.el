;;; init.el --- my local setting

;;; Commentary:
;;; Code:
;(setq debug-on-error t)
;(let ((default-directory "~/.emacs.d"))
;  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/init.d/")
(add-to-list 'load-path "~/.emacs.d/lib.d/")

(require 'init-global-configs)
(require 'init-packages)
(require 'init-frame)
(require 'init-programming-settings)
(require 'init-mew)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 )

;;; init.el ends here
