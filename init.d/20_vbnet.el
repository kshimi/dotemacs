(autoload 'vbnet-mode "vbnet-mode" "Mode for editing VB.NET code." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|cls\\|vb\\)$" .
				 vbnet-mode)) auto-mode-alist))
(custom-set-faces
 '(vbnet-funcall-face ((t (:foreground "cyan"))))
 '(vbnet-namespace-face ((t (:foreground "dark orange")))))

