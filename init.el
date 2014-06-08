;;; init.el --- my local setting

;;; Commentary:
;;; Code:
(setq debug-on-error t)
;(let ((default-directory "~/.emacs.d"))
;  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/init.d/")

(require 'init-global-configs)
(require 'init-packages)
(require 'init-frame)
(require 'init-ruby)
(require 'init-mew)

;; flycheck
(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)
(add-hook 'ruby-mode-hook 'flycheck-mode)

;; helm
(require 'helm-config)
;(require 'helm-migemo)
(require 'helm-rb)
(require 'helm-rails)

;; 
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode t)
;(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(default-input-method "MacOSX")
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
