;; mew
(when (package-installed-p 'mew)
  (require 'mew)
  (setq mew-mail-path "~/Mail")
  (autoload 'mew-user-agent-compose "mew" nil t)
  (if (boundp 'mail-user-agent)
      (setq mail-user-agent 'mew-user-agent))
  (if (fboundp 'define-mail-user-agent)
      (define-mail-user-agent
	'mew-user-agent
	'mew-user-agent-compose
	'mew-draft-send-message
	'mew-draft-kill
	'mew-send-hook))
  )
