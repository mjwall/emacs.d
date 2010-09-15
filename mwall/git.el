(add-to-list 'load-path (concat dotfiles-dir "/vendor/magit"))
(require 'magit)

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;; emacs-vcs
(autoload 'magit-status "magit" nil t)

;; Magit
(when (fboundp 'magit-status)
  (global-set-key (kbd "C-c g") 'magit-status))

