;; set frame size
(setq initial-frame-alist
      '((top . 0) (left . 0)
	(height . 58) (width . 82)
        (alpha . (85 . 50))))

(set-face-attribute 'default nil
		    :family "Ricty"
		    :height 100)
(set-fontset-font (frame-parameter nil 'font)
		  'japanese-jisx0208
		  (cons "Ricty" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
		  'japanese-jisx0212
		  (cons "Ricty" "iso10646-1"))
(set-fontset-font (frame-parameter nil 'font)
		  'katakana-jisx0201
		  (cons "Ricty" "iso10646-1"))
