(leaf all-the-icons :ensure t
  :custom ((all-the-icons-scale-factor . 1.0)))

(leaf doom-modeline :ensure t
  :hook (after-init-hook . doom-modeline-mode))
  :custom (doom-modeline-buffer-file-name-style 'truncate-with-project)
