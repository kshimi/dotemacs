;;; init.el --- my local setting

;;; Commentary:
;;; Code:
;(setq debug-on-error t)

;; load proxy setting
(let ((proxy-setting "~/.emacs.d/emacs-proxy.el"))
  (if (file-exists-p proxy-setting)
      (load proxy-setting)))

;; this enables this running method
;;   emacs -q -l ~/.debug.emacs.d/{{pkg}}/init.el
(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

;; custom file
(eval-and-compile
  (setq custom-file (locate-user-emacs-file "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file)))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("org"   . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu"   . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)
    (leaf magit :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))

;; ここにいっぱい設定を書く

(leaf leaf
  :config
  (leaf leaf-convert :ensure t)
  (leaf leaf-tree
    :ensure t
    :custom ((imenu-list-size . 30)
             (imenu-list-position . 'left))))

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand)))

(leaf selectrum
  :ensure t
  :config
  (selectrum-mode +1))

(leaf consult
  :ensure t
  :init
  (leaf orderless :ensure t)
  :config
  (setq completion-styles '(orderless)))

(leaf marginalia
  :ensure t
  :init
  (marginalia-mode))

(leaf projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; load init-loader
(leaf init-loader
  :ensure t
  :config
  (setq init-loader-show-log-after-init nil)
  (init-loader-load "~/.emacs.d/init.d/"))

;; start emacs server for emacsclient
;(unless (server-running-p)
;  (server-start))

(provide 'init)

;;; init.el ends here
