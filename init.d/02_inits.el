(show-paren-mode t)
(tool-bar-mode -1)

(load-library "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

(setq eww-search-prefix "http://www.google.com/search?q=")
