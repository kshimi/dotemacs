;;; init-ruby.el --- ruby configulations

;;; Commentary:
;;; Code:

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
(require 'smart-compile)
(define-key ruby-mode-map (kbd "C-c C-c") 'smart-compile)

;; Cucumber support mode
;(require 'feature-mode)
;(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; ruby debugger (rubydb3x.el)
(autoload 'rubydb "rubydb3x" nil t)

(provide 'init-ruby)
;;; init-ruby.el ends here
