;; auto install packages
(require 'cl)

(setq package-pinned-packages
      '(
	(async . "melpa-stable")
	(avy . "melpa-stable")
	(avy-zap . "melpa-stable")
	(dash . "melpa-stable")
	(epl . "melpa-stable")
	(exec-path-from-shell . "melpa-stable")
	(f . "melpa-stable")
	(git-commit . "melpa-stable")
	(helm . "melpa-stable")
	(helm-ag . "melpa-stable")
	(helm-core . "melpa-stable")
	(helm-descbinds . "melpa-stable")
	(helm-package . "melpa-stable")
	(inf-ruby . "melpa-stable")
	(inflections . "melpa-stable")
	(init-loader . "melpa-stable")
	(magit . "melpa-stable")
	(magit-popup . "melpa-stable")
	(mew . "melpa-stable")
	(migemo . "melpa-stable")
	(pkg-info . "melpa-stable")
	(popup . "melpa-stable")
	(projectile . "melpa-stable")
	(projectile-rails . "melpa-stable")
	(rake . "melpa-stable")
	(s . "melpa-stable")
	(web-mode . "melpa-stable")
	(which-key . "melpa-stable")
	(with-editor . "melpa-stable")
	))

(defvar installing-package-list
  '(
    init-loader
    auto-install
    exec-path-from-shell
    avy
    avy-zap
    migemo
    color-moccur
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
    web-mode
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
