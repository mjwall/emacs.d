;;; binding.el
;;
;; Combination of defunkt and ESK


;; fullscreen
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; File finding
(when (fboundp 'ibuffer)
  (global-set-key (kbd "C-x C-b") 'ibuffer))
(when (fboundp 'recentf-mode)
  (global-set-key (kbd "M-<f12>") 'recentf-open-files)
  (global-set-key (kbd "C-x f") 'recentf-ido-find-file))

;; Window switching
(windmove-default-keybindings)

;; Editing
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)
(global-set-key (kbd "C-c C-j") 'join-line)
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)
(global-set-key (kbd "<C-S-right>") 'textmate-shift-right)
(global-set-key (kbd "<C-S-left>") 'textmate-shift-left)
(global-set-key "\r" 'newline-maybe-indent) ;;instead of built in newline-and-indent
(global-set-key (kbd "C-;") 'comment-region)

;; no mail
(global-unset-key (kbd "C-x m"))

;; rebind to undo, stop suspending-frame
(global-set-key (kbd "C-z") 'undo)

;; add binding for switch window C-x o
(global-set-key [C-tab] 'other-window)
;; Misc
;;(when (fboundp 'magit-status)
;;  (global-set-key (kbd "C-c g") 'magit-status))

;; emacs-nav
(when (fboundp 'nav)
  (global-set-key (kbd "C-c n") 'nav-toggle))
