;; set frame size
(setq initial-frame-alist
      '((top . 0) (left . 0)
	(height . 45) (width . 82)
        (alpha . (95 . 85))))

(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 120)
(set-fontset-font (frame-parameter nil 'font)
		  'japanese-jisx0208
		  (cons "Ricty" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
		  'japanese-jisx0212
		  (cons "Ricty" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
		  'katakana-jisx0201
		  (cons "Ricty" "iso10646-1"))
