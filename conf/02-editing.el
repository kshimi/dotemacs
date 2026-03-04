;; C-h を Backspace (DEL) として扱う
(keyboard-translate ?\C-h ?\C-?)

;; paren
(show-paren-mode t) ; モード自体を有効化

(custom-set-faces
 ;; 対応するカッコ：背景を少し明るくし、文字を鮮やかなシアンに
 '(show-paren-match ((t (:background "#454b68" :foreground "#00ffff" :weight bold :underline t)))))
