(autoload 'vbnet-mode "vbnet-mode" "Mode for editing VB.NET code." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|cls\\|vb\\)$" .
				 vbnet-mode)) auto-mode-alist))
(set-face-attribute 'vbnet-funcall-face nil :foreground "light sky blue")
(set-face-attribute 'vbnet-namespace-face nil :foreground "dark orange")

