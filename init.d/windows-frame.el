(when (eq (window-system) 'w32)

  (if (equal system-name "PCS40513")
      (setq initial-frame-alist
	    '((top . 0) (left . 0)
	      (height . 57) (width . 88)))
    (setq initial-frame-alist
	  '((top . 0) (left . 700)
	    (height . 77) (width . 88))))

  (w32-ime-initialize)
  (setq default-input-method "W32-IME")
  (setq w32-ime-show-mode-line t)
  )

(custom-set-faces
 '(default ((t (:family #("ＭＳ ゴシック" 0 7 (charset cp932-2-byte)) :foundry "outline" :slant normal :weight normal :height 90 :width normal))))
 '(cursor ((t (:background "tomato")))))

(prefer-coding-system 'utf-8)
(setq default-process-coding-system 'utf-8)
(setq default-file-name-coding-system 'japanese-cp932-dos)
