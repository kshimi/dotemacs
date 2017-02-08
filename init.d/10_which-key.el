;;; Commentary: which-key
;;; Code:
(use-package which-key
  :config
  ;; (which-key-setup-side-window-bottom)    ;ミニバッファ
  ;; (which-key-setup-side-window-right)     ;右端
  (which-key-setup-side-window-right-bottom) ;両方使う
  (which-key-mode 1)
  )
