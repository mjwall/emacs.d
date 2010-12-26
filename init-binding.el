;;; binding.el
;;
;; Combination of defunkt and ESK

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; File finding
(when (fboundp 'ibuffer)
  (global-set-key (kbd "C-x C-b") 'ibuffer))
(when (fboundp 'recentf-mode)
  (global-set-key (kbd "M-<f12>") 'recentf-open-files)
  (global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
  (global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
  (global-set-key (kbd "C-c y") 'bury-buffer)
  (global-set-key (kbd "C-c r") 'revert-buffer)
  (global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)
  (global-set-key (kbd "C-x f") 'recentf-ido-find-file))

;; Window switching, shift and arrow key changes window
(windmove-default-keybindings)

;; Editing
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)
(global-set-key (kbd "C-c C-j") 'join-line)
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)
(global-set-key (kbd "<C-S-right>") 'textmate-shift-right)
(global-set-key (kbd "<C-S-left>") 'textmate-shift-left)
(global-set-key "\r" 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-region)


;; no mail
(global-unset-key (kbd "C-x m"))

;; rebind to undo, stop suspending-frame
(global-set-key (kbd "C-z") 'undo)

;; bind some window resizing
(global-set-key (kbd "C-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-s-<down>") 'shrink-window)
(global-set-key (kbd "C-s-<up>") 'enlarge-window)

(provide 'init-binding)
