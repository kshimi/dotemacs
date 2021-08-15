(eval-and-compile
  (setq-default bidi-display-reordering nil)
  (setq history-delete-duplicates t)
  (setq set-mark-command-repeat-pop t)
  (prefer-coding-system 'utf-8)
  (setq inhibit-compacting-font-caches t)

  (setq-default standard-indent 2)
  (setq-default indent-tabs-mode nil)

  (global-set-key (kbd "C-x C-b") 'ibuffer)

  (keyboard-translate ?\C-h ?\C-?)
  )

(leaf exec-path-from-shell
  :ensure t
  :config
  (when (memq system-type
              '(darwin))
    (require 'exec-path-from-shell nil nil)
    (exec-path-from-shell-initialize)))

(eval-and-compile
  (add-to-list 'load-path "~/.emacs.d/auto-install")
  (add-to-list 'load-path "~/.emacs.d/el-get")
  )

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
