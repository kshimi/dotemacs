;;; init.el --- my local setting

;;; Commentary:
;;; Code:
;(setq debug-on-error t)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(org-export-backends (quote (ascii html icalendar latex md)))
 '(safe-local-variable-values (quote ((Coding . iso-2022-7bit) (Coding . utf-8))))
 '(standard-indent 2))

(require 'init-loader)
(init-loader-load "~/.emacs.d/init.d/")

(unless (server-running-p)
  (server-start))

;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "tomato")))))
