;; turn off mouse interface early in startup to avoid momentary
;; display turned on later as needed
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq-default
  ;; me
  user-full-name "Michael Wall"
  user-mail-address "mjwall@gmail.com"
  ;; no startup message
  inhibit-startup-message t
  ;; no bell
  visible-bell nil
  ring-bell-function 'ignore
  ;; Backups, don't clutter up directories with files
  make-backup-files t ;; do make backups
  backup-by-copying t ;; and copy them here
  backup-directory-alist `(("." . ,(expand-file-name (concat user-emacs-directory "backups"))))
  ;; auto-saves too
  auto-save-file-name-transforms `((".*" ,(concat user-emacs-directory "auto-save/") t))
  ;; show empty lines after buffer end
  indicate-empty-lines t
  ;; use spaces not tabs
  indent-tabs-mode nil
  ;; 2 spaces
  tab-width 2
  ;; indent with tab function
  indent-line-function 'insert-tab
  ;; set whitespace style, turned on in coding hook
  whitespace-style '(trailing space-before-tab indentation space-after-tab tabs tab-mark)
  ;; integrate kill ring with clipboard
  x-select-enable-clipboard t
  mac-option-modifier 'meta
  mac-command-modifier 'hyper
  ;; make text-mode default, not fundamental
  major-mode 'text-mode
  )

;;; Other setting
;; transparently open compressed files
(auto-compression-mode t)
;; make emacs revert files when they change, for example when you switch git branches
(global-auto-revert-mode 1)
;; make backspace work as expected, esp in terminal
(normal-erase-is-backspace-mode t)
;; highlight matching parentheses when the point is on them.
(show-paren-mode t)
;; use y or n
(defalias 'yes-or-no-p 'y-or-n-p)
;; seed the random-number generator
(random t)
;; encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
;; redefine the boring startup message
(defun startup-echo-area-message () (concat "Emacs loaded in " (emacs-init-time)))
;; have to set this because loaded when daemon starts
(setq default-frame-alist '((font . "Menlo-15")))
;; (cua-mode 0)
(transient-mark-mode 1)
(electric-pair-mode 1)
;; Setup hippie-expand
;;(global-set-key [C-tab] 'hippie-expand)
;;(setq hippie-expand-try-functions-list '(try-expand-dabbrev
;;                                          try-expand-dabbrev-all-buffers
;;                                          try-expand-dabbrev-from-kill
;;                                          try-complete-file-name-partially
;;                                          try-complete-file-name
;;                                          try-expand-all-abbrevs
;;                                          try-expand-list
;;                                          try-expand-line
;;                                          try-complete-lisp-symbol-partially
;;                                          try-complete-lisp-symbol))

;;; Change some default keybinding
;; no mail
(global-unset-key (kbd "C-x m"))
;; from https://sites.google.com/site/steveyegge2/effective-emacs
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
;;(global-set-key (kbd "C-x m") 'execute-extended-command) ;; after I unset it
;; make Alt-` go to other frame as expected, like s-`
(global-set-key (kbd "M-`") 'other-frame)
;; keybinding to bring up ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;(global-set-key (kbd "C-c y") 'bury-buffer)
;;(global-set-key (kbd "C-c r") 'revert-buffer)
;; some more familiar keybindings for default functions
;;(global-set-key (kbd "C-c C-j") 'join-line)
(global-set-key "\r" 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
;; rebind to undo, stop suspending-frame
(global-set-key (kbd "C-z") 'undo)
;; not sure why this works on Mac but not Linux
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)
;; run compile from anywhere
;;(global-set-key [f12] 'compile)
;;(global-set-key [(meta f12)] 'recompile)
;; mac stuff
;;(global-set-key (kbd "H-c") 'kill-ring-save)
;;(global-set-key (kbd "H-x") 'kill-region)
;;(global-set-key (kbd "H-v") 'yank)
;;(global-set-key (kbd "H-s") 'save-buffer)
;;(global-set-key (kbd "H-w") 'kill-this-buffer)
;;(global-set-key (kbd "H-{") 'previous-buffer) ;;C-x <left>
;;(global-set-key (kbd "H-}") 'next-buffer) ;;C-x <right>
;;(global-set-key (kbd "H-z") 'undo)
;;(global-set-key (kbd "H-+") 'text-scale-increase)
;;(global-set-key (kbd "H-=") 'text-scale-increase)
;;(global-set-key (kbd "H-_") 'text-scale-decrease)
;;(global-set-key (kbd "H--") 'text-scale-decrease)
;;(if (fboundp 'toggle-frame-maximized)
;;    (global-set-key (kbd "<f11>") 'toggle-frame-maximized)) ;; vs fullscreen

;; put customizations in a seperate file that is git committed
;;(setq custom-file (expand-file-name "custom-shared.el" user-emacs-directory))
;;(load custom-file)
;; load custom file that is not committed
;;(load (expand-file-name "custom-private.el" user-emacs-directory))


;; dark please
(load-theme 'wombat)

;; these functions only run once when starting a daemon
;; so they don't do much good with the ec/et workflow
(when window-system
  (message "setting up in window-system")
  )

(when (not window-system)
  (message "setting up in terminal")
  ;;(add-to-list 'load-path (expand-file-name "site-lisp"
  ;;                          user-emacs-directory))
  ;; make copy-paste work for mac
  ;;(defun copy-from-osx ()
  ;;  (shell-command-to-string "pbpaste"))
  
  ;;(defun paste-to-osx (text &optional push)
  ;;  (let ((process-connection-type nil))
  ;;    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
  ;;      (process-send-string proc text)
  ;;      (process-send-eof proc))))
  
  ;;(setq interprogram-cut-function 'paste-to-osx)
  ;;(setq interprogram-paste-function 'copy-from-osx)
)

(ido-mode t)
(ido-everywhere t)
(setq ido-enable-prefix nil
  ido-ignore-directories '("\\`auto/" "\\`auto-save-list/" "\\`backups/" "\\`semanticdb/" "\\`target/" "\\`\\.git/" "\\`\\.svn/" "\\`CVS/" "\\`\\.\\./""\\`\\./")
  ido-ignore-files '("\\`auto/" "\\.prv/" "_region_" "\\.class/" "\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./")
  ;; Display ido results vertically, rather than horizontally
  ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match
]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

;; add keybindings so C-p and C-n move next with vertical results
;; and C-up and C-down do the same even if the current string
;; doesn't match
(add-hook
  'ido-setup-hook
  (lambda ()
    (define-key ido-completion-map (kbd "<up>") 'ido-prev-match)
    (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
    (define-key ido-completion-map (kbd "C-n") 'ido-next-match)))
;; key binding to open in other window
;;(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
;; setup recentf mode
(eval-after-load "recentf"
  '(setq recentf-max-saved-items 100))
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file
          (ido-completing-read "Choose recent file: "
            recentf-list nil t)))
    (when file
      (find-file file))))
(recentf-mode 1)
;;(global-set-key (kbd "M-<f12>") 'recentf-open-files)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)


;; Eshell
(require 'vc-git)
(load "em-hist") ;; load history vars
(setq eshell-cmpl-cycle-completions nil
  eshell-save-history-on-exit t
  eshell-cmpl-dir-ignore
  "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'"
  eshell-history-size 1024
  eshell-prompt-regexp "^[^#$]*[#$] "
  eshell-highlight-prompt nil
  eshell-visual-commands '("less" "top" "vim")
  eshell-visual-subcommands '(("git" "log" "diff" "di" "show"))
  eshell-destroy-buffer-when-process-dies t)
;; eshell prompt
(setq eshell-prompt-function
  (lambda ()
    (concat
      (propertize
        (concat user-login-name "@"
          (car (split-string system-name "\\.")))
        'face '(foreground-color . "green4"))
      (propertize
        (concat " " (abbreviate-file-name (eshell/pwd)))
        'face '(foreground-color . "darkgoldenrod4"))
      (when (vc-git-root (eshell/pwd))
        (propertize
          (concat " " (car (vc-git-branches)))
          'face '(foreground-color . "darkcyan")))
      "\n"
      (if (= (user-uid) 0) "# " "$ ")
      )))
(defalias 'ff 'find-file)
(defalias 'd 'dired)
(defalias 'fo 'find-file-other-window)
;;(defalias 'emacs 'find-file)
;;(defun my-eshell-other-window ()
;;  "Open a `eshell' in a new window."
;;  (interactive)
;;  (let ((buf (split-window-below -8)))
;;    (select-window buf)
;;    (eshell)))
;;(global-set-key [f5] 'my-eshell-other-window)

;; elisp
;;(setq lisp-indent-offset 2)

;; javascript
;;(setq js-indent-level 2)
