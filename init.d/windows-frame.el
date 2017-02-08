(when (eq (window-system) 'w32)

  (if (equal system-name "PCS40513")
      (setq initial-frame-alist
	    '((top . 0) (left . 0)
	      (height . 53) (width . 88)))
    (setq initial-frame-alist
	  '((top . 0) (left . 835)
	    (height . 83) (width . 88))))

  (if (functionp 'w32-ime-initialize)
      (progn
	(w32-ime-initialize)
	(setq default-input-method "W32-IME")
	(setq w32-ime-show-mode-line t))
    (progn
      (setq default-input-method "japanese-skk")
      (setq skk-isearch-start-node 'latin)))
  )

(custom-set-faces
 '(default ((t (:family "Myrica M" :foundry "outline" :slant normal :weight normal :height 98 :width normal))))
 '(cursor ((t (:background "tomato")))))

(set-default 'buffer-file-coding-system 'utf-8)
(add-to-list 'process-coding-system-alist '("git" utf-8-dos . utf-8-unix))
(add-to-list 'process-coding-system-alist '("rubocop" utf-8-dos . utf-8-unix))

(setq w32-rwindow-modifier (quote meta))
