;; init.el --- Initialization file for Emacs

;; Author: Mike Wall
;; URL: https://github.com/mjwall/emacs.d

;;; Commentary:
;; Emacs Startup File --- initialization for Emacs

;;; Code:

;; turn off mouse interface early to avoid flicker
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; some defaults
(setq-default
  user-full-name          "Michael Wall"
  user-mail-address       "mjwall@gmail.com"
  indent-tabs-mode        nil
  tab-width               2
  inhibit-startup-message t  
  )
;; revert files when they change, like when switching git branches
(global-auto-revert-mode 1)
;; use y or n
(defalias 'yes-or-no-p 'y-or-n-p)
;; use cua
(cua-mode 1)
;; but enable selection without the C-z/C-x/C-c/C-v bindings.
(cua-selection-mode t)
;; insert matching delimiters
(electric-pair-mode 1)
;; highlight matching parentheses when the point is on them.
(show-paren-mode t)
;; show (L:C) in modeline
(column-number-mode 1)
;; stop showing completion buffer from minibuffer, use ? if you really want it
;; didn't really work for ido
;;(setq completion-auto-help nil)

;; encoding UTF-8
(prefer-coding-system        'utf-8)
(set-default-coding-systems  'utf-8)
(set-language-environment    'utf-8)
(set-selection-coding-system 'utf-8)
(set-language-environment    "UTF-8")

;; backups
(defconst private-dir  (expand-file-name "private" user-emacs-directory))
(defconst temp-dir (format "%s/cache" private-dir)
  "Hostname-based elisp temp directories")
(setq
 delete-old-versions                t
 history-length                     1000
 backup-inhibited                   nil
 make-backup-files                  t
 auto-save-default                  t
 auto-save-list-file-name           (concat temp-dir "/autosave")
 make-backup-files                  t
 create-lockfiles                   nil
 backup-directory-alist            `((".*" . ,(concat temp-dir "/backup/")))
 auto-save-file-name-transforms    `((".*" ,(concat temp-dir "/auto-save-list/") t)))
(unless (file-exists-p (concat temp-dir "/auto-save-list"))
		       (make-directory (concat temp-dir "/auto-save-list") :parents))

;; put customizations in a seperate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Change some default keybinding
;; from https://sites.google.com/site/steveyegge2/effective-emacs
;; easier on the fingers and I don't do mail
(global-unset-key (kbd "C-x m"))
(global-set-key (kbd "C-x m") 'execute-extended-command)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
;; go to ibuffer instead of showing the list 
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; kill the current buffer, don't ask
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)
;; add keys for indenting
(global-set-key (kbd "C->") 'indent-rigidly-right-to-tab-stop)
(global-set-key (kbd "C-<") 'indent-rigidly-left-to-tab-stop)
;; comments - since M-; call comment-dwim with doesn't comment a line
;; but this is not working in the terminal https://emacs.stackexchange.com/a/1056
;;(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; theme - wombat is a good default dark one, adwaita is a good default light one
(load-theme 'adwaita t)

;; add ~/.emacs.d/site-lisp
;; not using packages so anything that needs to be loaded must come from here
;; keeping is separate from site-lisp for now
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; ido
(setq
 ;; Display ido results vertically, rather than horizontally
 ido-decorations '("\n-> " " " "\n   " "\n   ..."
                   "[" "]" " [No match]" " [Matched]"
                   " [Not readable]" " [Too big]" " [Confirm]")
 ido-enable-flex-matching t
 ido-enable-prefix nil
 ido-everywhere t
 ido-max-prospects 20
 )
(defun my/ido-keys ()
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "<up>") 'ido-prev-match))
(add-hook 'ido-setup-hook 'my/ido-keys)
(ido-mode 1)
(defvar ido-other-ignore-directories
  '("\\`auto/" "\\`auto-save-list/" "\\`backups/" "\\`semanticdb/"
    "\\`target/" "\\`\\.git/" "\\`\\.svn/" ))
(add-to-list 'ido-ignore-directories 'ido-other-ignore-directories)
(defvar ido-other-ignore-files
  '("\\`auto/" "\\.prv/" "_region_" "\\.class/"))
(add-to-list 'ido-ignore-files 'ido-other-ignore-files)

;; recentf
(recentf-mode 1)
(setq
 recentf-max-saved-items 50
 recentf-save-file (expand-file-name "recentf" temp-dir)
 )
(global-set-key (kbd "C-x f") 'recentf-open-files)

;; expansion
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))
;; reassign from dabbrev-expand
(global-set-key (kbd "M-/") 'hippie-expand)

;; vc
(setq version-control      t
      vc-make-backup-files t
      vc-follow-symlinks   t
      )
(require 'log-edit)
(require 'vc-git)
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG\\'" . vc-git-log-edit-mode))

;; org mode
(setq org-startup-truncated nil) ;; wrap lines

;; speedbar 
(setq
  speedbar-use-images         nil
  speedbar-show-unknown-files t
  speedbar-update-flag        nil
  )

;; sr-speedbar - because speedbar doesn't work in terminal
;; NOT built-in, see site-lisp
(require 'sr-speedbar)
(setq
  sr-speedbar-right-side   nil
  sr-speedbar-auto-refresh nil
  )

;; find file - because project-find-file is ugly
;; NOT built-in, see site-lisp
(require 'find-file-in-git-repo)

(require 'project)
(global-set-key (kbd "<f5>") 'vc-dir)
(global-set-key (kbd "<f6>") 'vc-git-grep)
;; (global-set-key (kbd "<f7>") 'project-find-file)
(global-set-key (kbd "<f7>") 'find-file-in-git-repo)
(global-set-key (kbd "<f8>") 'sr-speedbar-toggle)
(global-set-key (kbd "<f9>") 'eshell)

(provide 'init)
;;; init.el ends here
