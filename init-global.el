;;; init-global.el
;;
;; This file is a combination of global.el from defunkt and ESK's starter-kit-misc.el

;; encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")

(ansi-color-for-comint-mode-on)

(setq visible-bell nil
      ring-bell-function 'ignore
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t
      x-select-enable-clipboard t
      kill-whole-line t                 ;; delete line in one stage
      mouse-yank-at-point t             ;; paste at cursor, NOT at mouse pointer position
      next-line-add-newlines nil        ;; don't add new lines when scrolling down
      require-final-newline t           ;; end files with a newline
      safe-local-variable-values '((encoding . utf-8) (prompt-to-byte-compile))
      scroll-margin 0                   ;; do smooth scrolling, ...
      scroll-conservatively 100000      ;; ... the defaults ...
      scroll-up-aggressively 0          ;; ... are very ...
      scroll-down-aggressively 0        ;; ... annoying
      user-full-name "Michael Wall"     ;; Set name
      user-mail-address "mjwall@gmail.com" ;; Set e-mail address
      ;; set ispell to use brew installed aspell,
      ;; http://sunny.in.th/2010/05/08/emacs-enabling-flyspell-mode-gave-an-error.html
      ispell-program-name "aspell"
      )

;; make backspace mode work correctly
(normal-erase-is-backspace-mode 1)

;; delete selected on keypress
(delete-selection-mode 1)

;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

;; recentf stuff
(require 'recentf)
(recentf-mode 1)

;; no line numbers unless I say so, but set the format for when I do
(global-linum-mode 0)
(setq linum-format "%4d ")

(defalias 'yes-or-no-p 'y-or-n-p)
(random t) ;; Seed the random-number generator

;; Backups, don't clutter up directories with files
(setq make-backup-files t ;; do make backups
      backup-by-copying t ;; and copy them here
      backup-directory-alist `(("." . ,(expand-file-name (concat dotfiles-dir "backups"))))
      version-control t
      kept-new-versions 2
      kept-old-versions 5
      delete-old-versions t)

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)

;; turn menu-bar back on
;(menu-bar-mode 1)

;; Start server for emacs client
(server-start)

(provide 'init-global)
