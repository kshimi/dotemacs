(eval-and-compile
  (setq inhibit-startup-screen t)
  (setq initial-scratch-message nil)
  (show-paren-mode t)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  (global-hl-line-mode 1)
  )

(leaf elscreen
  :ensure t
  :custom
  ((elscreen-tab-display-kill-screen . nil)
   (elscreen-tab-display-control . nil))
  :config (elscreen-start))

(leaf all-the-icons
  :ensure t
  :custom ((all-the-icons-scale-factor . 1.0)))

(leaf doom-modeline
  :ensure t
  :hook (after-init-hook . doom-modeline-mode)
  :custom (doom-modeline-buffer-file-name-style 'truncate-with-project))

(leaf which-key
  :ensure t
  :config
  (which-key-setup-side-window-right-bottom) ;両方使う
  (which-key-mode 1))

(leaf iceberg-emacs
  :el-get apnsngr/iceberg-emacs
  :config
  (load-library "iceberg-emacs/iceberg-theme")
  (set-face-attribute 'hl-line nil :background "#272c42")
  (set-face-attribute 'cursor nil :background "tomato")
  (set-face-attribute 'region nil :background "#493E54" :underline "peach puff")
  (load-theme 'iceberg))
