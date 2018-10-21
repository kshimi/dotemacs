(use-package smart-mode-line
  :init
  (setq custom-safe-themes
        (quote
         ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
  (setq sml/theme 'dark)
  (setq rm-blacklist '(" Helm" " AC" " WK" " Hmio" " Undo-Tree" " EditorConfig" " yas" " ElDoc" " ARev"))
  :config
  (sml/setup)
  :ensure t
  )
