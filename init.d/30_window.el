;; manage window 
;; rubikitch 235

(defvar selected-window-minimum-width 83
  "適切な幅")
(defun wider-window ()
  "左右分割されたウィンドウのサイズを選択されたウィンドウを大きめにして調整する"
  (interactive)
  (balance-windows)
  (let ((window-min-width  (/ (- (frame-width) selected-window-minimum-width)
                              (1- (length (window-list nil 'no-minibuf))))))
    (when (< (window-width) selected-window-minimum-width)
      (maximize-window))))

(defun balance-windows-horizontally (&optional window-or-frame)
  (interactive)
  (let* ((window
          (cond
           ((or (not window-or-frame)
                (frame-live-p window-or-frame))
            (frame-root-window window-or-frame))
           ((or (window-live-p window-or-frame)
                (window-child window-or-frame))
            window-or-frame)
           (t
            (error "Not a window or frame %s" window-or-frame))))
         (frame (window-frame window)))
    ;; Balance horizontally.
    (window--resize-reset (window-frame window) t)
    (balance-windows-1 window t)
    (when (window--resize-apply-p frame t)
      (window-resize-apply frame t)
      (window--pixel-to-total frame t)
      (run-window-configuration-change-hook frame))))


(require 'dash)
(defun balance-windows-and-enlarge-horizontally ()
  "左右分割されたウィンドウのサイズを選択されたウィンドウを大きめにして調整する"
  (interactive)
  (balance-windows-horizontally)
  (let* ((fixed-size-windows (--select (buffer-local-value 'window-size-fixed (window-buffer it))
                          (window-list nil 'no-minibuf)))
         (wlist (--select (and (not (eq (selected-window) it))
                               (not (buffer-local-value 'window-size-fixed (window-buffer it))))
                          (window-list nil 'no-minibuf)))
         (window-min-width  (/ (- (frame-width) selected-window-minimum-width
                                  (--reduce-from (window-width it) 0 fixed-size-windows))
                               (length wlist))))
    (when (and (not window-size-fixed) (< (window-width) selected-window-minimum-width))
      (maximize-window))))
(defun my-other-window (arg)
 (interactive "P")
  (cond (arg                            ;C-uをつけたら
         (select-window (split-window-horizontally))
         (balance-windows-and-enlarge-horizontally))
        ((one-window-p)                 ;分割してないならば
         (split-window-horizontally))
        (t                              ;C-uなし
         (other-window 1)
         (balance-windows-and-enlarge-horizontally))))

(defun switch-to-buffer-split-other-window (buf &rest ignore)
  (interactive "bSwitch to buffer in other window: ")
  (select-window (split-window-horizontally))
  (switch-to-buffer buf)
  (balance-windows-and-enlarge-horizontally))
(defun find-file-split-other-window (file &rest ignore)
  (interactive "fFind file in other window: ")
  (switch-to-buffer-split-other-window (find-file-noselect file)))
(advice-add 'switch-to-buffer-other-window :override 'switch-to-buffer-split-other-window)
(advice-add 'find-file-other-window :override 'find-file-split-other-window)


(global-set-key (kbd "C-t") 'my-other-window)

(winner-mode 1)
(global-set-key (kbd "C-q") 'winner-undo)
;; 元のC-qを別なキーに退避させる
(global-set-key (kbd "C-c q") 'quoted-insert)
