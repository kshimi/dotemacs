(show-paren-mode t)
(tool-bar-mode -1)

(load-library "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))
(define-key input-decode-map (kbd "<backspace>") (kbd "C-h"))

(when (package-installed-p 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

(setq eww-search-prefix "http://www.google.com/search?q=")
