;; set frame size
(setq initial-frame-alist
      '((top . 22) (left . 1.0)
	(height . 73) (width . 190)
        (alpha . (93 . 80))))

(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 180)
(set-fontset-font (frame-parameter nil 'font)
		  'japanese-jisx0208
		  (cons "Ricty" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
		  'japanese-jisx0212
		  (cons "Ricty" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
		  'katakana-jisx0201
		  (cons "Ricty" "iso10646-1"))

;; set Command key for Meta
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))
