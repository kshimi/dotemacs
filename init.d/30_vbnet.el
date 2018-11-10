(autoload 'vbnet-mode "vbnet-mode" "Mode for editing VB.NET code." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|cls\\|vb\\)$" .
				 vbnet-mode)) auto-mode-alist))
(defun my-vbnet-mode-fn ()
  "My ook for VB.NET mode."
  (interactive)
  (set-face-attribute 'vbnet-funcall-face nil :foreground "light sky blue" :background "#161822")
  (set-face-attribute 'vbnet-namespace-face nil :foreground "dark orange" :background "#161822")
  )
(add-hook 'vbnet-mode-hook 'my-vbnet-mode-fn)

