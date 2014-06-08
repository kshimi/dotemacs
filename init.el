;;; init.el --- my local setting

;;; Commentary:
;;; Code:
(setq debug-on-error t)

;set frame
(if (window-system)
    (setq initial-frame-alist
	  '((top . 22) (left . 1610)
	    (height . 99) (width . 130))))
(set-fontset-font nil 'japanese-jisx0208
 (font-spec :family "Hiragino Kaku Gothic ProN"))

;;; key binding
(load-library "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

;; packages
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(exec-path-from-shell-initialize)

;; ruby-mode
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))


;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle 'overlay)

;(add-hook 'ruby-mode-hook 'robe-mode)
;(add-hook 'ruby-mode-hook 'ac-robe-setup)

;; ruby-electric
;(require 'ruby-electric)
;(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;(setq ruby-electric-expand-delimiters-list nil)

;; start compile
;(require 'smart-compile)
;(define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
;(define-key ruby-mode-map (kbd "C-c C-c") (kbd "C-c c C-m"))

(require 'google-this)
(google-this-mode t)

;; flycheck
(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)
(add-hook 'ruby-mode-hook 'flycheck-mode)

;; helm
(require 'helm-config)
;(require 'helm-migemo)
(require 'helm-rb)
(require 'helm-rails)

;; Cucumber support mode
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; 
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode t)
;(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

;;; Mew setting
(require 'mew)
(setq mew-mail-path "~/Dropbox/Mail")
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

(show-paren-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(default-input-method "MacOSX")
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
