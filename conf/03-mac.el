;;; --- Mac固有の使い勝手向上 ---
(when (eq system-type 'darwin)
  ;; CommandキーをMeta、OptionキーをAlt（あるいはそのまま）に
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'alt)
  ;; Macのインライン日本語入力を有効化
  (mac-auto-ascii-mode 1))
