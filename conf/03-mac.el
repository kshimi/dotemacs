;;; --- Mac固有の使い勝手向上 ---
(when (eq system-type 'darwin)
  ;; CommandキーをMeta、OptionキーをAlt（あるいはそのまま）に
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'alt)
  ;; Macのインライン日本語入力を有効化
  (mac-auto-ascii-mode 1)

  ;;; --- フォント設定 (Apple Silicon Mac 最適化) ---
  (defun my-setup-font-mac ()
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
  (add-hook 'after-init-hook 'my-setup-font-mac))
