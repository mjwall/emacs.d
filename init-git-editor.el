;; Use built in stuff for a git commit
;;
;; export GIT_EDITOR='emacs -nw -Q -l ~/.emacs.d/init-git-editor.el

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(global-set-key "\C-x\C-m" 'execute-extended-command)

(require 'log-edit)
(require 'vc-git)
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG\\'" . vc-git-log-edit-mode))
