;; which-key
(when (package-installed-p 'which-key)
  (require 'which-key)
  ;; (which-key-setup-side-window-bottom)    ;ミニバッファ
  ;; (which-key-setup-side-window-right)     ;右端
  (which-key-setup-side-window-right-bottom) ;両方使う
  (which-key-mode 1)
)
