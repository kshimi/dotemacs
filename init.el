;;; --- パッケージ管理の設定 ---
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Emacs 29以降は use-package が標準搭載
(require 'use-package)
(setq use-package-always-ensure t)

;;; --- 設定ファイル分割のための準備 ---
(defvar conf-dir (expand-file-name "conf" user-emacs-directory))

;; confディレクトリが存在しなければ作成
(unless (file-exists-p conf-dir)
  (make-directory conf-dir))

;; conf内の .el ファイルをすべてロードする関数
(let ((el-files (directory-files conf-dir t "\\.el$")))
  (dolist (file el-files)
    (load file)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:background "#454b68" :foreground "#00ffff" :weight bold :underline t))))
 '(vertico-current ((t (:background "#3d425b" :foreground "#ffffff" :weight bold)))))
