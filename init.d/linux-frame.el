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
