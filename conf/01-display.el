;;; --- 最小限の見た目と挙動 ---
(setq inhibit-startup-message t) ; スタートアップ画面を表示しない
(tool-bar-mode -1)               ; ツールバー非表示
(menu-bar-mode 1)                ; メニューバーは慣れるまで表示（後で消せます）
(scroll-bar-mode -1)             ; スクロールバー非表示
(global-display-line-numbers-mode t) ; 行番号表示

;;; ---外観・テーマ ---
(use-package iceberg-theme
  :ensure t
  :config
  (iceberg-theme-create-theme-file)
  (load-theme 'solarized-iceberg-dark t)
  (set-face-attribute 'cursor nil :background "tomato")
  ;; 
  (custom-set-faces
   ;; Verticoの現在の選択行を目立たせる
   '(vertico-current ((t (:background "#3d425b" :foreground "#ffffff" :weight bold))))))

;;; --- フレーム（ウィンドウ）設定 ---
(setq initial-frame-alist
      '((top . 0.0) (left . 1.0)
        (height . 65) (width . 140)))

;; ピクセル単位でリサイズを許可（ターミナルのガタつき防止に有効）
(setq frame-resize-pixelwise t)
(setq window-resize-pixelwise t)

;; Emacs 29以降の透明度設定 (alpha-background)
;; 背後の壁紙がほんのり透ける、より綺麗な透明化です
;(add-to-list 'default-frame-alist '(alpha-background . 28))
