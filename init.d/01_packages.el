;; auto install packages
(require 'cl)

(defvar installing-package-list
  '(
    init-loader
    auto-install
    exec-path-from-shell
    avy
    avy-zap
    migemo
    helm
    helm-descbinds
    helm-package
    helm-swoop
    helm-ag
    helm-projectile
    magit
    undohist
    elscreen
    projectile-rails
    ruby-guard
    open-junk-file
    visual-regexp
    which-key
    mew    
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
