(leaf mozc-el-extensions
  :el-get iRi-E/mozc-el-extensions)

;; ime settings
(cond
 ((executable-find "mozc_emacs_helper")
  (leaf mozc
    :ensure t
    :init
    (leaf mozc-im :ensure t)
    (leaf mozc-popup :ensure t)
    :require t
    :config
    (require 'cl-lib)
    (require 'mozc)
    (require 'mozc-im)
    (require 'mozc-popup)
    (setq default-input-method "japanese-mozc-im")
    (setq mozc-candidate-style 'popup)

    ;; cursor-color-settings
    (require 'mozc-cursor-color)
    (setq mozc-cursor-color-alist '((direct        . "red")
                                    (read-only     . "yellow")
                                    (hiragana      . "green")
                                    (full-katakana . "goldenrod")
                                    (half-ascii    . "dark orchid")
                                    (full-ascii    . "orchid")
                                    (half-katakana . "dark goldenrod")))
    (blink-cursor-mode 0)
    (make-variable-buffer-local 'mozc-im-mode)
    (add-hook 'mozc-im-activate-hook (lambda () (setq mozc-im-mode t)))
    (add-hook 'mozc-im-deactivate-hook (lambda () (setq mozc-im-mode nil)))
    (advice-add 'mozc-cursor-color-update
                :around (lambda (orig-fun &rest args)
                          (let ((mozc-mode mozc-im-mode))
                            (apply orig-fun args))))

    ;; isearch settings
    (add-hook 'isearch-mode-hook
              (lambda ()
                (setq im-state mozc-im-mode)))
    (add-hook 'isearch-mode-end-hook
              (lambda ()
                (unless (eq im-state mozc-im-mode)
                  (if im-state
                      (activate-input-method default-input-method)
                    (deactivate-input-method)))))

    ;; wdired 終了時に IME を OFF にする
    (require 'wdired)
    (advice-add 'wdired-finish-edit
                :after (lambda (&rest args)
                         (deactivate-input-method)))

    ;; Windows の mozc では、セッション接続直後 directモード になるので hiraganaモード にする
    (when (or
           (memq system-type '(windows-nt))
           (and
            (memq system-type '(gnu/linux))
            (string-match-p "Microsoft" (shell-command-to-string "uname -v"))))
      (advice-add 'mozc-session-execute-command
                  :after (lambda (&rest args)
                           (when (eq (nth 0 args) 'CreateSession)
                             ;; (mozc-session-sendkey '(hiragana)))))
                             (mozc-session-sendkey '(Hankaku/Zenkaku))))))

    (when (memq system-type '(windows-nt))
      ;; IME が ON の時、カーソルの移動が遅くなるのを改善する
      (setq w32-pipe-read-delay 10))
    ))

 ((functionp 'w32-ime-initialize)
  (progn
    (w32-ime-initialize)
    (setq default-input-method "W32-IME")
    (setq w32-ime-show-mode-line t)
    (w32-ime-initialize)
    (add-hook 'minibuffer-setup-hook 'deactivate-input-method)
    (add-hook 'isearch-mode-hook
              '(lambda ()
                 (deactivate-input-method)
                 (setq w32-ime-composition-window (minibuffer-window))))
    (add-hook 'isearch-mode-end-hook
              '(lambda () (setq w32-ime-composition-window nil)))
    ))

 (progn
   (setq default-input-method "japanese-skk")
   (setq skk-isearch-start-node 'latin))
 )
