(setq-default bidi-display-reordering nil)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq history-delete-duplicates t)
(setq set-mark-command-repeat-pop t)
(show-paren-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)

(setq-default standard-indent 2)
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(load-library "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))
(define-key input-decode-map (kbd "<backspace>") (kbd "C-h"))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize)
  :ensure t)

(add-to-list 'load-path "~/.emacs.d/auto-install")
(add-to-list 'load-path "~/.emacs.d/lib")

;;(load-theme 'misterioso)
(load-library "iceberg-emacs/iceberg-theme")
(set-face-attribute 'hl-line nil :background "#272c42")
(set-face-attribute 'cursor nil :background "tomato")
(set-face-attribute 'region nil :background "#493E54" :underline "peach puff")

(unless (eq (window-system) 'w32)
  (setq browse-url-browser-function 'eww-browse-url)
  (setq eww-search-prefix "http://www.google.com/search?q=")
  )

;;Correspond to Imagemagick7
(when (eq (window-system) 'w32)
  (setq image-dired-cmd-create-thumbnail-program "magick")
  )
