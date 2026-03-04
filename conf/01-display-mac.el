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
      '((top . 22) (left . 1.0)
        (height . 58) (width . 140)))

;; Emacs 29以降の透明度設定 (alpha-background)
;; 背後の壁紙がほんのり透ける、より綺麗な透明化です
(add-to-list 'default-frame-alist '(alpha-background . 28))

;;; --- フォント設定 (Apple Silicon Mac 最適化) ---
(defun my-setup-font ()
  (let* ((font-name "PlemolJP Console")
	 (font-size 18)                 ;; 以前の180相当は16〜18程度
         (font-spec (font-spec :family font-name :size font-size)))
    
    ;; 英数フォントの設定
    (set-face-attribute 'default nil :family font-name :height (* font-size 10))
    
    ;; 日本語フォントの設定 (emacs-mac 向けの簡潔な書き方)
    (set-fontset-font nil 'japanese-jisx0208 font-spec)
    (set-fontset-font nil 'japanese-jisx0212 font-spec)
    (set-fontset-font nil 'katakana-jisx0201 font-spec)))

;; 起動時および新しくフレームを作った時にフォントを適用
(add-hook 'after-init-hook 'my-setup-font)
