;; ime settings
(cond
 ((executable-find "mozc_emacs_helper")
  (use-package mozc
    :ensure t
    :init
    (use-package mozc-im :ensure t)
    (use-package mozc-popup :ensure t)
    :config
    (require 'cl-lib)
    (setq default-input-method "japanese-mozc-im")
    (setq mozc-candidate-style 'popup)

    ;; cursor-color-settings
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

    ;; helm でミニバッファの入力時に IME の状態を継承しない
    (setq helm-inherit-input-method nil)

    ;; helm の検索パターンを mozc を使って入力した場合にエラーが発生することがあるのを改善する
    (advice-add 'mozc-helper-process-recv-response
                :around (lambda (orig-fun &rest args)
                          (cl-loop for return-value = (apply orig-fun args)
                                   if return-value return it)))

    ;; helm の検索パターンを mozc を使って入力する場合、入力中は helm の候補の更新を停止する
    (advice-add 'mozc-candidate-dispatch
                :before (lambda (&rest args)
                          (when helm-alive-p
                            (cl-case (nth 0 args)
                              ('update
                               (unless helm-suspend-update-flag
                                 (helm-kill-async-processes)
                                 (setq helm-pattern "")
                                 (setq helm-suspend-update-flag t)))
                              ('clean-up
                               (when helm-suspend-update-flag
                                 (setq helm-suspend-update-flag nil)))))))

    ;; helm で候補のアクションを表示する際に IME を OFF にする
    (advice-add 'helm-select-action
                :before (lambda (&rest args)
                          (deactivate-input-method)))

    (when (eq (window-system) 'w32)
      ;; IME が ON の時、カーソルの移動が遅くなるのを改善する
      (setq w32-pipe-read-delay 10)

      ;; Windows の mozc では、セッション接続直後 directモード になるので hiraganaモード にする
      (advice-add 'mozc-session-execute-command
                  :after (lambda (&rest args)
                           (when (eq (nth 0 args) 'CreateSession)
                             ;; (mozc-session-sendkey '(hiragana)))))
                             (mozc-session-sendkey '(Hankaku/Zenkaku)))))
      )
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
    (advice-add 'helm :around
                '(lambda (orig-fun &rest args)
                   (let ((select-window-functions nil)
                         (w32-ime-composition-window (minibuffer-window)))
                     (deactivate-input-method)
                     (apply orig-fun args))))))

 (progn
   (setq default-input-method "japanese-skk")
   (setq skk-isearch-start-node 'latin))
 )
