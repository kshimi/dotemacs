(leaf rbenv
  :ensure t
  :if (not (memq system-type '(windows-nt)))
  :init
  (setq rbenv-installation-dir "~/.rbenv")
  (setq rbenv-show-active-ruby-in-modeline nil)
  :config
  (global-rbenv-mode)
  )

(leaf mermaid-mode
  :el-get abrochard/mermaid-mode)

(leaf leaf
  :el-get
  (rcodetools
   :url "https://raw.githubusercontent.com/rcodetools/rcodetools/master/misc/rcodetools.el"
   t))

(leaf vbnet-mode
  :el-get emacsmirror/vbnet-mode)

(leaf web-mode
  :ensure t
  :mode "\\.html?\\'" "\\.erb\\'" "\\.jsp\\'" "\\.s?ss\\'")

(leaf emmet-mode
  :ensure t
  :hook (web-mode-hook))
