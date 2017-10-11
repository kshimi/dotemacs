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
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; load init-loader
(unless (package-installed-p 'init-loader)
  (package-refresh-contents)
  (package-install 'init-loader))
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/init.d/")

;; load use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; start emacs server for emacsclient
;(unless (server-running-p)
;  (server-start))

;;; init.el ends here
