(require 'anything-myrurema)

(require 'inf-ruby)
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-eval-binding "Pry.toplevel_binding")
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)

(require 'robe)
(require 'ac-robe)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (robe-mode)
             (robe-ac-setup)
             ))


