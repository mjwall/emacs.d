;; turn off mouse interface early to avoid flicker
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(let ((minver "26.0"))
  (when (version< emacs-version minver)
    (error
      "Your Emacs is too old -- this config requires v%s or higher" minver)))

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
  backup-directory-alist
  `(("." . ,(expand-file-name (concat user-emacs-directory "backups"))))
  ;; auto-saves too
  auto-save-file-name-transforms
  `((".*" ,(concat user-emacs-directory "auto-save/") t))
  ;; show empty lines after buffer end
  indicate-empty-lines t
  ;; use spaces not tabs
  indent-tabs-mode nil
  ;; 2 spaces
  tab-width 2
  ;; indent with tab function
  indent-line-function 'insert-tab
  ;; set whitespace style, turned on in coding hook
  whitespace-style
  '(trailing space-before-tab indentation space-after-tab tabs tab-mark)
  ;; integrate kill ring with clipboard
  x-select-enable-clipboard t
  ;; make text-mode default, not fundamental
  major-mode 'text-mode)

;; Other setting
;; transparently open compressed files
(auto-compression-mode t)
;; make emacs revert files when they change, for example
;; when you switch git branches
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
(column-number-mode 1) ; show (L:C) in modeline
;; redefine the boring startup message
(defun startup-echo-area-message ()
  (concat "Emacs loaded in " (emacs-init-time)))

;;; Change some default keybinding
;; no mail
(global-unset-key (kbd "C-x m"))
;; from https://sites.google.com/site/steveyegge2/effective-emacs
;; --- no longer used, see smex below
;; (global-set-key (kbd "C-x C-m") 'execute-extended-command)
;;(global-set-key (kbd "C-x m") 'execute-extended-command) ;; after I unset it
;; make Alt-` go to other frame as expected, like s-`
(global-set-key (kbd "M-`") 'other-frame)
;; keybinding to bring up ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; some more familiar keybindings for default functions
(global-set-key (kbd "C-c C-j") 'join-line)
(global-set-key "\r" 'newline-and-indent)
;; TODO: figure out why the next one doesn't work in terminal
(global-set-key (kbd "C-;") 'comment-or-uncomment-region) 
;; rebind to undo, stop suspending-frame
(global-set-key (kbd "C-z") 'undo)
;; not sure why this works on Mac but not Linux
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;; put customizations in a seperate file that is git committed
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; add ~/.emacs.d/site-lisp
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; theme
;; - wombat is a good default on
;; - custom themes in in ~/.emacs.d/themes so just load them
;; - https://github.com/dracula/emacs
;; - https://github.com/jonathanchu/atom-one-dark-theme
;; - https://github.com/mjwall/ample-zen
(add-to-list 'custom-theme-load-path
  (expand-file-name "themes/" user-emacs-directory))
(load-theme 'atom-one-dark)


;; UI stuff, have to set at top when using daemon
;; because (when window-system) and (when not window-system)
;; only run when the daemon is started
(if (eq system-type 'darwin)
  (progn
    (setq default-frame-alist '((font . "Menlo-15")))
    ;;ls does not support --dired
    (require 'ls-lisp)
    (setq ls-lisp-use-insert-directory-program nil)
    ;; missing stuff in path
    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))
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

;; custom editing functions, I have lost where they originated
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

;; packages
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(setq package-archive-priorities '(("org" . 3)
                                   ("melpa" . 2)
                                   ("gnu" . 1)))

;; use-package
;; - https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; org-mode
;; - https://orgmode.org/
(use-package org
  ;; using org-plus-contrib is a hack to make package.el load the newer
  :ensure org-plus-contrib
  :defer t
  :pin "org"
  :demand t)

;; ensure system package
;; - part of use-package at https://github.com/jwiegley/use-package
(use-package use-package-ensure-system-package
  :ensure t)

;; help setup paths
;; - https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

;; ido - built in
;; - https://github.com/birkenfeld/idomenu
;; - https://github.com/DarwinAwardWinner/ido-completing-read-plus
;; - https://github.com/nonsequitur/smex
(use-package ido
  :preface
  (defvar ido-other-ignore-directories
    '("\\`auto/" "\\`auto-save-list/" "\\`backups/" "\\`semanticdb/"
       "\\`target/" "\\`\\.git/" "\\`\\.svn/" ))
  (defvar ido-other-ignore-files
    '("\\`auto/" "\\.prv/" "_region_" "\\.class/"))  
  :init
  (use-package idomenu
    ;; not built in 
    :ensure t
    :bind (("C-x C-i" . idomenu )))
  (use-package recentf
    ;; built in
    :preface
    (defun recentf-ido-find-file ()
      "Find a recent file using ido."
      (interactive)
      (let ((file
              (ido-completing-read "Choose recent file: "
                recentf-list nil t)))
        (when file
          (find-file file))))    
    :init
    (recentf-mode 1)
    (setq
      recentf-max-saved-items 1000
      recentf-exclude '("/tmp/" "/ssh:"))
    :bind (("C-x f" . recentf-ido-find-file)))
  (ido-mode t)
  (ido-everywhere t)
  (setq
    ido-enable-prefix nil
    ido-enable-flex-matching t
    ido-max-prospects 20
    ido-ignore-directories (append ido-ignore-directories
                             ido-other-ignore-directories)
    ido-ignore-files (append ido-ignore-files ido-other-ignore-files)
    ;; Display ido results vertically, rather than horizontally
    ido-decorations '("\n-> " " " "\n   " "\n   ..."
                       "[" "]" " [No match]" " [Matched]"
                       " [Not readable]" " [Too big]" " [Confirm]"))      
  ;; C-n/p is more intuitive in vertical layout
  (add-hook 'ido-setup-hook
    (lambda ()
      (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
      (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
      (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
      (define-key ido-completion-map (kbd "<up>") 'ido-prev-match)))
  (use-package ido-completing-read+
    :ensure t
    :init
    (ido-ubiquitous-mode 1))
  (use-package smex
    :ensure t
    :bind (("M-x" . smex)
            ("C-x C-m" . smex)
            ;; orig M-x
            ("C-c C-c M-x" . execute-extended-command))))

;; hippie expand - built in
(use-package hippie-expand
  :init
  (use-package dabbrev
    :config
    (setf dabbrev-case-fold-search nil)
    ;; M-/ already rebound to undo, unbind the backward key
    (global-unset-key (kbd "C-M-/")))
  (use-package abbrev
    :config
    ;; don't prompt for ~/.emacs.d/themes
    (setq save-abbrevs 'silently)
    (setq-default abbrev-mode t))
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
  :bind
  (("C-<tab>" . hippie-expand)))

;; git - built in
(use-package vc-git
  :defer t
  :preface
  ;; In vc-git and vc-dir for git buffers,
  ;; make (C-x v) a run git add, u run git reset,
  ;; and r run git reset and checkout from head.
  ;; based on https://joppot.info/en/2018/02/04/4144
  (defun my-vc-git-command (verb fn)
    (let* ((fileset-arg (or vc-fileset (vc-deduce-fileset nil t)))
            (backend (car fileset-arg))
            (files (nth 1 fileset-arg)))
      (if (eq backend 'Git)
        (progn (funcall fn files)
          (message (concat verb " " (number-to-string (length files))
                     " file(s).")))
        (message "Not in a vc git buffer."))))
  (defun vc-git-add (&optional revision vc-fileset comment)
    (interactive "P")
    (my-vc-git-command "Staged" 'vc-git-register))
  (defun vc-git-reset (&optional revision vc-fileset comment)
    (interactive "P")
    (my-vc-git-command "Unstaged"
      (lambda (files) (vc-git-command nil 0 files "reset" "-q" "–"))))
  (defun vc-git-dir-refresh-and-update ()
    "Refresh the vc-dir then hide up to date files and directories"
    (interactive)
    (vc-dir-refresh)
    (vc-dir-hide-up-to-date))
  :init
  (use-package vc-dir)
  (define-key vc-prefix-map [(r)] 'vc-revert-buffer)
  (define-key vc-dir-mode-map [(r)] 'vc-revert-buffer)
  (define-key vc-prefix-map [(a)] 'vc-git-add)
  (define-key vc-dir-mode-map [(a)] 'vc-git-add)
  (define-key vc-prefix-map [(u)] 'vc-git-reset)
  (define-key vc-dir-mode-map [(u)] 'vc-git-reset)
  (define-key vc-dir-mode-map [(g)] 'vc-git-dir-refresh-and-update))

;; eshell - built in
(use-package eshell
  :defer t
  :init
  (use-package em-prompt
    :after vc-git
    :preface
    (defun better-eshell-prompt ()
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
        (if (= (user-uid) 0) "# " "$ ")))
    :init
    (setq
      eshell-highlight-prompt nil
      eshell-prompt-regexp "^[^#$]*[#$] "
      eshell-prompt-function 'better-eshell-prompt))
  (use-package em-hist
    :init
    (setq
      eshell-save-history-on-exit t
      eshell-history-size 1024))
  (use-package em-cmpl
    :init
    (setq
      eshell-cmpl-cycle-completions nil
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'"))
  (use-package em-term
    :init
    (setq
      eshell-visual-commands '("less" "top" "vim")
      eshell-visual-subcommands '(("git" "log" "diff" "di" "show"))))
  :config
  (defalias 'ff 'find-file)
  (defalias 'd 'dired)
  (defalias 'fo 'find-file-other-window))

;; project - built in
(use-package project
  :init
  (use-package sr-speedbar
    :ensure t)
  :bind
  (("<f6>" . vc-git-grep)
    ("<f7>" . project-find-file)
    ("<f8>" . sr-speedbar)
    ("<f9>" . vc-dir)))

;; Language Specific

;; Java
;; - https://github.com/jdee-emacs/jdee
(use-package jdee
  :ensure t
  :defer t
  :init
  (custom-set-variables
    '(jdee-server-dir
       (expand-file-name "jdee-server" user-emacs-directory))))

;; Javascript
;; - https://github.com/mooz/js2-mode
;; - https://github.com/joshwnj/json-mode
(use-package js2-mode
  :ensure t
  :defer t
  :mode "\\.js\\'"
  :interpreter "node"
  :init
  (setq js-indent-level 2) ;; defalias js2-basic-off in > 25.0
  :config
  (use-package json-mode
    :ensure t))

;; Typescript 
;; - https://github.com/ananthakumaran/typescript.el
;; - https://github.com/ananthakumaran/tide
;; - https://github.com/AdamNiederer/ng2-mode
(use-package typescript-mode
  :ensure t
  :defer t
  :init
  (setf typescript-indent-level js-indent-level)
  :config
  (use-package ng2-mode
    :ensure t)
  (use-package tide
    :ensure t
    :after (typescript-mode flycheck)
    :hook
    ((typescript-mode . tide-setup)
      (typescript-mode . tide-h1-identifier-mode)
      (before-save . tide-format-before-save))))

;; python
;; based on http://www.andrewty.com/blog/emacs-config-for-python
;; - https://github.com/proofit404/anaconda-mode
;; - https://github.com/necaris/conda.el
;; - https://github.com/millejoh/emacs-ipython-notebook
;; - https://github.com/paetzke/py-autopep8.el
(use-package anaconda-mode
  :ensure t
  :defer t
  :init
  (setq python-indent-offset 4
    python-indent 4
    python-shell-interpreter "ipython"
    python-shell-interpreter-args "--simple-prompt")
  (use-package conda
    :ensure t
    :init
   (setq conda-anaconda-home "~/anaconda3")
   (conda-env-initialize-interactive-shells)
   (conda-env-initialize-eshell))
  (use-package ein
    :ensure t
    :init
    (setq
      ein:jupyter-default-notebook-directory "~/git/jupyter"
      ein:jupyter-default-server-command "~/anaconda3/bin/jupyter"
      ein:jupyter-server-args (list "--no-browser")))
  (use-package py-autopep8
    :ensure-system-package (autopep8 . "conda install autopep8")
    :ensure t
    :hook ((python-mode . py-autopep8-enable-on-save)))
  :hook
  ((python-mode . anaconda-mode)
    (python-mode . anaconda-eldoc-mode)))

;; golang
;; - https://github.com/dominikh/go-mode.el (guru and rename too)
;; - https://github.com/syohex/emacs-go-eldoc
;; - https://github.com/nlamirault/gotest.el
(use-package go-mode
  :ensure t
  :preface
  (defun my-go-mode-fn()
    (go-eldoc-setup)
    (go-guru-hl-identifier-mode)
    (flycheck-mode 1)
    (setq imenu-generic-expression
          '(("type" "^type *\\([^ \t\n\r\f]*\\)" 1)
            ("func" "^func *\\(.*\\) {" 1))))
  :init
  (use-package go-rename
    :ensure t
    :defer t)
  (use-package go-guru
    :ensure t
    :defer t)
  (use-package go-eldoc
    :ensure t
    :defer t)
  (use-package gotest
    :ensure t
    :defer t)
  (use-package go-complete
    :ensure t
    :defer t)
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-copy-env "GOPATH"))
  (setq gofmt-command "goimports") 
  :bind
  (:map go-mode-map
   ("M-." . go-guru-definition)
   ("C-c d" . godoc-at-point)
   ("C-c g" . godoc)
   ("C-c h" . go-guru-hl-identifier))
  :hook ((before-save-hook . gofmt-before-save)
          (go-mode . my-go-mode-fn)))

;; c/c++
;; for c++ 14 look at cquery, for c++ 17 look at ccls
(use-package cc-mode
  :init
  (setq tab-width 2
    c-basic-offset 2))

;; xml/html
(use-package nxml-mode
  :init
  (setq nxml-slash-auto-complete-flag t)
  (fset 'html-mode 'nxml-mode))

;; kotlin
(use-package kotlin-mode
  :ensure t)

;; elisp - built in
(use-package emacs-lisp-mode
  :init
  (setq lisp-indent-offset 2)
  (use-package eldoc
      :hook ((emacs-lisp-mode . turn-on-eldoc-mode)))
  (use-package ert
    :init
    (add-to-list 'emacs-lisp-mode-hook 'ert--activate-font-lock-keywords))
  :bind (("M-." . find-function-at-point)
         ("M-&" . complete-symbol))
  :interpreter (("emacs" . emacs-lisp-mode)))

;; bash - built in
(use-package sh-script
  :init
  (setq sh-basic-offset 2))

;; octave - built in
(use-package octave)

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

;; jflex
;; in site-lisp from http://jflex.de/jflex-mode.el
(use-package jflex-mode)

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
