;;; --- Windows固有の使い勝手向上 ---
(when (eq system-type 'windows-nt)
  ;; Windows 特有の設定
  (setq default-directory "~/")
  (setq command-line-default-directory "~/")

  ;; IMEの設定 (tr-ime)
  ;; Windowsネイティブ環境でGoogle日本語入力を快適に使う
  (use-package tr-ime
    :ensure t
    :config
    (tr-ime-standard-install)
    (setq default-input-method "W32-IME")
    (w32-ime-initialize)
    )

  ;; Alt/Ctrl の挙動
  ;; WindowsキーをSuperに、変換キーなどの挙動を調整
  (setq w32-lwindow-modifier 'super) ; Left Windows key
  (setq w32-rwindow-modifier 'super) ; Right Windows key
  (setq w32-pass-lwindow-to-system nil)
  (setq w32-pass-rwindow-to-system nil)
  
  ;; パフォーマンス向上 (Magit等)
  ;; Windowsネイティブ環境では外部プロセスが遅いため、属性取得を簡略化する
  (setq w32-get-true-file-attributes nil)

  ;;; --- フォント設定 (Windows 向け) ---
  (defun my-setup-font-windows ()
    (let* ((font-name "PlemolJP Console")
           (font-size 20) ; Windowsでは12〜14程度が適切
           (font-spec (font-spec :family font-name :size font-size)))
      
      ;; 英数フォントの設定
      (set-face-attribute 'default nil :family font-name :height (* font-size 6))
      
      ;; 日本語フォントの設定
      (set-fontset-font nil 'japanese-jisx0208 font-spec)
      (set-fontset-font nil 'japanese-jisx0212 font-spec)
      (set-fontset-font nil 'katakana-jisx0201 font-spec)))
  
  ;; 起動時および新しくフレームを作った時にフォントを適用
  (add-hook 'after-init-hook 'my-setup-font-windows))

;;; --- WSL2 固有の設定 ---
;; Windows環境のWSL上で動作している場合に適用
(when (and (eq system-type 'gnu/linux)
           (getenv "WSL_DISTRO_NAME"))
  
  ;; 日本語入力 (mozc)
  (use-package mozc
    :ensure t
    :config
    (setq default-input-method "japanese-mozc"))

  ;; クリップボードの共有 (WSL2 -> Windows)
  ;; Windows側の clip.exe を利用してコピーを実現
  (when (executable-find "clip.exe")
    (defun wsl-copy (start end)
      (interactive "r")
      (shell-command-on-region start end "clip.exe"))
    (global-set-key (kbd "M-w") 'wsl-copy))

  ;; ブラウザの共有 (WSL2 -> Windows)
  ;; Windows側のブラウザでURLを開く
  (let ((cmd-exe "/mnt/c/Windows/System32/cmd.exe"))
    (when (file-exists-p cmd-exe)
      (setq browse-url-generic-program cmd-exe)
      (setq browse-url-generic-args '("/c" "start"))
      (setq browse-url-browser-function 'browse-url-generic))))
