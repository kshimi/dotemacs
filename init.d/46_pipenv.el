(use-package pipenv :ensure t
  :if (executable-find "pipenv")
  :hook (python-mode . pipenv-mode))
