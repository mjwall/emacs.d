;; turn off mouse interface early to avoid flicker
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
  backup-directory-alist `(("." . , (expand-file-name (concat user-emacs-directory "backups"))))
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
  ;;mac-option-modifier 'meta
  ;;mac-command-modifier 'hyper
  ;; make text-mode default, not fundamental
  major-mode 'text-mode
  )

;;; Other setting
;; transparently open compressed files
(auto-compression-mode t)
;; make emacs revert files when they change, for example when you switch git branches
(global-auto-revert-mode 1)
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
(cua-mode 1) ; default
(transient-mark-mode 1)
(electric-pair-mode 1)
;; redefine the boring startup message
(defun startup-echo-area-message () (concat "Emacs loaded in " (emacs-init-time)))

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
;; some more familiar keybindings for default functions
(global-set-key (kbd "C-c C-j") 'join-line)
(global-set-key "\r" 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
;; rebind to undo, stop suspending-frame
(global-set-key (kbd "C-z") 'undo)
;; not sure why this works on Mac but not Linux
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;; put customizations in a seperate file that is git committed
(setq custom-file (expand-file-name "custom-shared.el" user-emacs-directory))
(load custom-file)
;; load custom file that is not committed
;; (load (expand-file-name "custom-private.el" user-emacs-directory))

;; UI stuff, have to set at top when using daemon
;; because (when window-system) and (when not window-system)
;; only run when the daemon is started
(load-theme 'wombat)
(setq default-frame-alist '((font . "Menlo-15")))

;; these functions only run once when starting a daemon
;; so they don't do much good with the ec/et workflow
;;(when window-system
;;  (message "setting up in window-system")
;;  )
;;(when (not window-system)
;;  (message "setting up in terminal")
;;)

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

;;; language specific stuff

;; elisp
;;(setq lisp-indent-offset 2)

;; javascript
;;(setq js-indent-level 2)
