;;; --- 1. Vertico: 補完UIを縦並びにする ---
(use-package vertico
  :init
  (vertico-mode)
  :custom
  (vertico-count 20)      ; 表示する候補数
  (vertico-resize t)     ; 候補数に合わせて高さを自動調整
  (vertico-cycle t))     ; 候補をループさせる

;;; --- 2. Orderless: スペース区切りで柔軟に検索 ---
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;;; --- 3. Consult: 便利な検索・移動コマンド群 ---
(use-package consult
  :preface
  ;; Emacs 30未満での警告回避
  (unless (boundp 'minibuffer-visible-completions)
    (defvar minibuffer-visible-completions nil))
  :bind (;; 以前の Helm-mini のようなバッファ切り替え
         ("C-x b" . consult-buffer)
         ;; 行検索 (以前の occur や helm-swoop の代わり)
         ("M-s l" . consult-line)
         ;; ファイル内検索 (grep系)
         ("M-s g" . consult-grep)
         ("M-s r" . consult-ripgrep)
         ;; ヘルプ系の強化
         ("C-h i" . consult-info))
  :config
  ;; プレビュー機能を有効にする (バッファ切り替え時などに中身が見える)
  (setq consult-preview-key 'any))

;;; --- 4. Marginalia: 補完候補に説明（属性）を付け加える ---
(use-package marginalia
  :init
  (marginalia-mode))
