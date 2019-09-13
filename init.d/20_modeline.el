(use-package all-the-icons :ensure t
  :custom (all-the-icons-scale-factor 1.0))

(use-package doom-modeline :ensure t
  :custom (doom-modeline-buffer-file-name-style 'truncate-with-project)
  :hook (after-init . doom-modeline-mode))
