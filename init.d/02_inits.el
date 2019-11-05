(setq-default bidi-display-reordering nil)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq history-delete-duplicates t)
(setq set-mark-command-repeat-pop t)
(show-paren-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode 1)
(prefer-coding-system 'utf-8)
(setq inhibit-compacting-font-caches t)

(setq-default standard-indent 2)
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(keyboard-translate ?\C-h ?\C-?)

(use-package exec-path-from-shell
  :if (memq system-type '(darwin))
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

(setq backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))

(when (window-system)
  (setq frame-title-format '(:eval (if (buffer-file-name) " %f" " %b"))))

(unless (memq system-type '(windows-nt))
  (setq browse-url-browser-function 'eww-browse-url)
  (setq eww-search-prefix "http://www.google.com/search?q=")
  )

;;Correspond to Imagemagick7
(when (memq system-type '(windows-nt))
  (setq image-dired-cmd-create-thumbnail-program "magick")
  )
