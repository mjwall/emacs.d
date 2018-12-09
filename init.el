;; turn off mouse interface early to avoid flicker
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(let ((minver "26.0"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

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
(cua-selection-mode t) ; but use standard Emacs keybindings
(transient-mark-mode 1)
(electric-pair-mode 1)
;; add ~/.emacs.d/site-lisp
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))
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
(global-set-key (kbd "C-;") 'comment-or-uncomment-region) ;; doesn't work in terminal
;; rebind to undo, stop suspending-frame
(global-set-key (kbd "C-z") 'undo)
;; not sure why this works on Mac but not Linux
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)
;; hippie expand
(global-set-key [C-tab] 'hippie-expand)
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                          try-expand-dabbrev-all-buffers
                                          try-expand-dabbrev-from-kill
                                          try-complete-file-name-partially
                                          try-complete-file-name
                                          try-expand-all-abbrevs
                                          try-expand-list
                                          try-expand-line
                                          try-complete-lisp-symbol-partially
                                          try-complete-lisp-symbol))


;; put customizations in a seperate file that is git committed
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; UI stuff, have to set at top when using daemon
;; because (when window-system) and (when not window-system)
;; only run when the daemon is started
(load-theme 'wombat)
(if (eq system-type 'darwin)
  (progn
    (setq default-frame-alist '((font . "Menlo-15")))
    ;;ls does not support --dired
    (require 'ls-lisp)
    (setq ls-lisp-use-insert-directory-program nil)
    ))
(if (eq system-type 'gnu/linux)
  (setq default-frame-alist '((font . "Monospace-14")))
  )

;; these functions only run once when starting a daemon
;; so they don't do much good with the ec/et workflow
;;(when window-system
;;  (message "setting up in window-system")
;;  )
;;(when (not window-system)
;;  (message "setting up in terminal")
;;)

;;; Editing functions
(defun indent-buffer ()
  "indent whole buffer"
  (interactive)
  (indent-region (point-min) (point-max) nil))
(defun untabify-buffer ()
  "Change all tabs to spaces in current buffer"
  (interactive)
  (untabify (point-min) (point-max)))
(defun cleanup-buffer ()
  "Perform indent, untabify and remove trailing whitespace on current buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated.  However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
      (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
      (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)
(defun shift-right (&optional arg)
  "Shift the line or region to the ARG places to the right."
  (interactive)
  (let ((deactivate-mark nil)
         (beg (or (and mark-active (region-beginning))
                (line-beginning-position)))
         (end (or (and mark-active (region-end)) (line-end-position))))
    (indent-rigidly beg end (* (or arg 1) tab-width))))
(global-set-key (kbd "<M-right>") 'shift-right)
(defun shift-left (&optional arg)
  "Shift the line or region to the ARG places to the left."
  (interactive)
  (shift-right (* -1 (or arg 1))))
(global-set-key (kbd "<M-left>") 'shift-left)
(defun move-text-internal (arg)
  (cond
    ((and mark-active transient-mark-mode)
      (if (> (point) (mark))
        (exchange-point-and-mark))
      (let ((column (current-column))
             (text (delete-and-extract-region (point) (mark))))
        (forward-line arg)
        (move-to-column column t)
        (set-mark (point))
        (insert text)
        (exchange-point-and-mark)
        (setq deactivate-mark nil)))
    (t
      (let ((column (current-column)))
        (beginning-of-line)
        (when (or (> arg 0) (not (bobp)))
          (forward-line)
          (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg)
            (when (and (eval-when-compile
                         '(and (>= emacs-major-version 24)
                            (>= emacs-minor-version 3)))
                    (< arg 0))
              (forward-line -1)))
          (forward-line -1))
        (move-to-column column t)))))
(defun move-text-down (arg)
  "Move region or current line `arg' lines down."
  (interactive "*p")
  (move-text-internal arg))
(defun move-text-up (arg)
  "Move region or current line `arg' lines up."
  (interactive "*p")
  (move-text-internal (- arg)))
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)
(defun end-newline-and-indent ()
  "Go to the end of the current line, then run
`newline-and-indent'"
  (interactive)
  (progn
    (move-end-of-line 1)
    (newline-and-indent)))
(global-set-key [(control return)] 'end-newline-and-indent)
(defun smarter-move-beginning-of-line (arg)
  "Toggle between `beginning-of-line' and `back-to-indentation'."
  (interactive "^p")
  (setq arg (or arg 1))
  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))
(global-set-key [remap move-beginning-of-line]
  'smarter-move-beginning-of-line)
(defun dos2unix ()
  "Not exactly but it's easier to remember"
  (interactive)
  (set-buffer-file-coding-system 'unix 't))

;;; ido mode
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
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

;; vc-git - https://joppot.info/en/2018/02/04/4144
(require 'vc-git)
;; In vc-git and vc-dir for git buffers,
;; make (C-x v) a run git add, u run git reset,
;; and r run git reset and checkout from head.
(defun my-vc-git-command (verb fn)
  (let* ((fileset-arg (or vc-fileset (vc-deduce-fileset nil t)))
          (backend (car fileset-arg))
          (files (nth 1 fileset-arg)))
    (if (eq backend 'Git)
      (progn (funcall fn files)
        (message (concat verb " " (number-to-string (length files))
                   " file(s).")))
      (message "Not in a vc git buffer."))))
(defun my-vc-git-add (&optional revision vc-fileset comment)
  (interactive "P")
  (my-vc-git-command "Staged" 'vc-git-register))
(defun my-vc-git-reset (&optional revision vc-fileset comment)
  (interactive "P")
  (my-vc-git-command "Unstaged"
    (lambda (files) (vc-git-command nil 0 files "reset" "-q" "–"))))
(eval-after-load "vc-dir"
  '(progn
     (define-key vc-prefix-map [(r)] 'vc-revert-buffer)
     (define-key vc-dir-mode-map [(r)] 'vc-revert-buffer)
     (define-key vc-prefix-map [(a)] 'my-vc-git-add)
     (define-key vc-dir-mode-map [(a)] 'my-vc-git-add)
     (define-key vc-prefix-map [(u)] 'my-vc-git-reset)
     (define-key vc-dir-mode-map [(u)] 'my-vc-git-reset)

     ;; hide up to date files after refreshing in vc-dir
     (define-key vc-dir-mode-map [(g)]
       (lambda () (interactive) (vc-dir-refresh) (vc-dir-hide-up-to-date)))
     ))

;;; Eshell
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
  eshell-destroy-buffer-when-process-dies nil)
;; eshell prompt - requires vc-git
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

;; project.el
(global-set-key [f7] 'project-find-file)
(global-set-key [f6] 'vc-git-grep)
(global-set-key [f9] 'vc-dir)

;;; Now for packages
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;(add-to-list 'package-archives
;;             '("marmalade" . "https://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives
;;             '("org" . "http://orgmode.org/elpa/") t)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(use-package ample-zen-theme
  :ensure t)

(use-package zenburn-theme
  :ensure t
  ;;:init
  ;;(load-theme 'zenburn)
)

;; this screws with other themes
;; (use-package leuven-theme
;;  :ensure t)
  
(use-package solarized-theme
  :ensure t)

(use-package spacemacs-theme
  :ensure t
  :defer t
  :init (load-theme 'spacemacs-dark t))

(use-package dired-sidebar
  :ensure t
  :bind (([f8] . dired-sidebar-toggle-sidebar))
  :init
  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'nerd)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t)
  :hook (dired-sidebar-mode-hook . (lambda ()
                                     (unless (file-remote-p default-directory)
                                       (auto-revert-mode)))))

(use-package idomenu
  :ensure t
  :bind (("C-x C-i" . idomenu))) ;; C-x C-i

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode))


(use-package company
  :ensure t)

;;; Language Specific

(require 'cc-mode)

;; Java - https://github.com/emacs-lsp/lsp-java

(use-package lsp-mode
  :ensure t
  :init (setq lsp-eldoc-render-all nil
          lsp-highlight-symbol-at-point nil))

(use-package company-lsp
  :after  company
  :ensure t
  :config
  (setq company-lsp-cache-candidates t
    company-lsp-async t))

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-update-mode 'point))

(use-package lsp-java
  :ensure t
  :after company
  :config
  (add-hook 'java-mode-hook
    (lambda ()
      (setq-local company-backends (list 'company-lsp))))

  ;;(add-hook 'java-mode-hook 'lsp-java-enable)
  (add-hook 'java-mode-hook 'flycheck-mode)
  (add-hook 'java-mode-hook 'company-mode)
  ;;(add-hook 'java-mode-hook 'lsp-ui-mode)
  )

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java
  :after (lsp-java))

;; javascript/typescript

(setq-default js-indent-level 2)

(use-package ng2-mode
  :ensure t)

(use-package typescript-mode
  :ensure t
  :init
  (setf typescript-indent-level js-indent-level))

;; python - from http://www.andrewty.com/blog/emacs-config-for-python
(use-package anaconda-mode
  :ensure t
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  :config
  (setq python-indent-offset 4
    python-indent 4
    python-shell-interpreter "ipython"
    python-shell-interpreter-args "--simple-prompt")
  ;; (use-package company-anaconda
  ;;    :ensure t
  ;;    :init
  ;;    (eval-after-load "company"
  ;;      '(add-to-list 'company-backends '(company-anaconda :with company-capf))))
  )

(use-package conda
  :ensure t
  :config
  (setq conda-anaconda-home "~/anaconda3")
  (conda-env-initialize-interactive-shells)
  (conda-env-initialize-eshell))
(use-package ein
  :ensure t
  :config
  (setq ein:jupyter-default-notebook-directory "~/git/jupyter")
  (setq ein:jupyter-default-server-command "~/anaconda3/bin/jupyter")
  (setq ein:jupyter-server-args (list "--no-browser")))
;; conda install autopep8 (plus any env)
(use-package py-autopep8
  :ensure t
  ;;:config
  ;;(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  )

(use-package lsp-python
  :ensure t
  :config
  ;; (use-package company-anaconda
  ;;    :ensure t
  ;;    :init
  ;;    (eval-after-load "company"
  ;;      '(add-to-list 'company-backends '(company-anaconda :with company-capf))))
  )

;; go

(use-package go-mode
  :ensure t)

(use-package lsp-go
  :ensure t
  :config
  (add-hook 'go-mode-hook #'lsp-go-enable)
  )

(use-package eglot
  :ensure t
  ;; :hook (typescript-mode . eglot-ensure)
  )

;; c/c++

;; kotlin
(use-package kotlin-mode
  :ensure t)

;; elisp
(setq lisp-indent-offset 2)

;; bash

;; octave
(use-package octave
  :ensure t)

;; R
(use-package ess
  :ensure t
  ;;:init (require 'ess-site)
  )

;; docker
(use-package dockerfile-mode
  :ensure t)

;; thrift
(use-package thrift
  :ensure t)

;; protobuf
(use-package protobuf-mode
  :ensure t)

;; jflex - http://jflex.de/jflex-mode.el
(require 'jflex-mode)

;; make/cmake
(use-package cmake-mode
  :ensure t)

;; gradle
(use-package gradle-mode
  :ensure t)

;; julia
(use-package julia-mode
  :ensure t)

;; scala
(use-package scala-mode
  :ensure t)

;; clojure
(use-package clojure-mode
  :ensure t)

;; markdown
(use-package markdown-mode
  :ensure t)
