;;; Commentary: org
;;; Code:
(use-package org
  :bind
  ("C-c c" . org-capture)
  ("C-c a" . org-agenda)
  ("<f6>" . org-agenda-default)
  ("C-c l" . org-store-link)
  :custom
  (org-directory "~/org/")
  (org-capture-templates
   '(("m" "Memo" entry (file+headline "memo.org" "Memo")
      "** %U %a %?\n%i\n")))
  (org-agenda-start-with-log-mode t "時刻の記録をagendaに表示させる")
  (org-agenda-span 30 "inbox.orgのサンプルにあわせ、今日から30日分の予定を表示させる")
  (org-agenda-files '("~/org/inbox.org" "~/org/daily-projects.org") "org-agendaで扱うorgファイルたち")
  (org-agenda-custom-commands
   '(("a" "Agenda and all TODO's"
      ((tags "project-CLOCK=>\"<today>\"|repeatable") (agenda "") (alltodo))))
   "agendaには、習慣・スケジュール・TODOを表示させる")
  :config
  (defun org-agenda-default ()
    (interactive)
    (org-agenda nil "a"))
  (defun org-capture-fill-template--stringify-annotation (&rest ignore)
    (unless (stringp (org-capture-get :annotation))
      (plist-put org-capture-plist :annotation (format "%s" (org-capture-get :annotation)))))
  (advice-add 'org-capture-fill-template :before
	      'org-capture-fill-template--stringify-annotation)
  )
