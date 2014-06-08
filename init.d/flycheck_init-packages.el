;;; init-packages.el --- packages

;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(
    anzu
    helm
    flycheck
    auto-complete
    undo-tree
    mew
    projectile
    helm-projectile
    google-this
    markdown-mode
    ruby-block
    rspec-mode
    feature-mode
    scss-mode
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

(provide 'init-packages)
;;; init-packages.el ends here
