;; auto install packages
(require 'cl)

(defvar installing-package-list
  '(
    exec-path-from-shell
    auto-install
    init-loader
    migemo
    helm
    helm-descbinds
    helm-package
    helm-swoop
    helm-ag
    magit
    ace-jump-mode
    undohist
    elscreen
    helm-projectile
    projectile-rails
    ruby-guard
    mew
    open-junk-file
    visual-regexp
    which-key
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
