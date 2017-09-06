(setq-default bidi-display-reordering nil)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq history-delete-duplicates t)
(setq set-mark-command-repeat-pop t)
(show-paren-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq-default standard-indent 2)
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(load-library "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))
(define-key input-decode-map (kbd "<backspace>") (kbd "C-h"))

(unless (eq (window-system) 'w32)
  (when (package-installed-p 'exec-path-from-shell)
    (exec-path-from-shell-initialize)))

(load-theme 'misterioso)

(setq eww-search-prefix "http://www.google.com/search?q=")
