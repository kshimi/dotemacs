;;; init.el --- my local setting

;;; Commentary:
;;; Code:
;(setq debug-on-error t)

;; load proxy setting
(let ((proxy-setting "~/.emacs.d/emacs-proxy.el"))
  (if (file-exists-p proxy-setting)
      (load proxy-setting)))

;; package initialize
(require 'package)
(let ((protocol (if (eq (window-system) 'w32) "http://" "https://")))
  (add-to-list 'package-archives (cons "melpa" (concat protocol "melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat protocol "stable.melpa.org/packages/")) t))
(setq package-archive-priorities
      '(("gnu" . 5) ("melpa-stable" . 10) ("melpa" . 0)))
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
(package-initialize)

;; load use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'bind-key)
  (package-install 'use-package))

;; load init-loader
(unless (package-installed-p 'init-loader)
  (package-refresh-contents)
  (package-install 'init-loader))
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/init.d/")

;; start emacs server for emacsclient
;(unless (server-running-p)
;  (server-start))

;;; init.el ends here
