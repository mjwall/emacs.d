;;; init.el --- Initialization file for Emacs

;; Author: Mike Wall
;; URL: https://github.com/mjwall/emacs.d

;;; Commentary:
;; Emacs Startup File --- initialization for Emacs

;;; Code:

;; turn off mouse interface early to avoid flicker
;(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; holler if old emacs
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
  major-mode 'text-mode
  ;; https://www.timeanddate.com/sun/usa/baltimore
  calendar-longitute -76.62
  calendar-latitue 39.28
  calendar-location-name "Baltimore, MD"
  calendar-time-zone -300
  calendar-standard-time-zone-name "EST"
  calendar-daylight-time-zone-name "EDT"
  compilation-scroll-output 'first-error
  ;; I hit this often enough to warrant asking
  confirm-kill-emacs 'y-or-n-p
  ;; bookmarks
  bookmark-save-flag t
  )

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
  "My function to override the startup message."
  (concat "Emacs loaded in " (emacs-init-time)))

;;; Change some default keybinding
;; no mail
(global-unset-key (kbd "C-x m"))
;; from https://sites.google.com/site/steveyegge2/effective-emacs
;; --- no longer used, used smex for a while, now using counsel
;; (global-set-key (kbd "C-x C-m") 'execute-extended-command)
;; (global-set-key (kbd "C-x m") 'execute-extended-command) ;; after I unset it
;; make Alt-` go to other frame as expected, like s-`
(global-set-key (kbd "M-`") 'other-frame)
;; keybinding to bring up ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; some more familiar keybindings for default functions
;;(global-set-key (kbd "C-c C-j") 'join-line)
(global-set-key "\r" 'newline-and-indent)
;; TODO: figure out why the next one doesn't work in terminal
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
;; rebind to undo, stop suspending-frame
(global-set-key (kbd "C-z") 'undo)
;; Just kill this one, I don't want to be asked
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;; put customizations in a seperate file that is git committed
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; add ~/.emacs.d/site-lisp
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; theme
;; - wombat is a good default dark one, adwaita is a good default light one
;; - custom themes in in ~/.emacs.d/themes so just load them
;; - https://github.com/dracula/emacs
;; - https://github.com/jonathanchu/atom-one-dark-theme
;; - https://github.com/mjwall/ample-zen
;; - https://github.com/maio/eink-emacs
;; - https://github.com/anler/minimal-theme
;; - https://github.com/jimeh/twilight-bright-theme.el
;; - https://github.com/dgutov/espresso-theme
;; - https://github.com/tmalsburg/tango-plus-theme
(defvar my-theme-dir (expand-file-name "themes/" user-emacs-directory))
(add-to-list 'custom-theme-load-path my-theme-dir)
(load-theme 'espresso t)


;; UI stuff, have to set at top when using daemon
;; because (when window-system) and (when not window-system)
;; only run when the daemon is started
(if (eq system-type 'darwin)
  (progn
    (setq default-frame-alist '((font . "Menlo-13")))
    ;;ls does not support --dired
    (require 'ls-lisp)
    (set-variable 'ls-lisp-use-insert-directory-program nil)
    ;; missing stuff in path
    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))
    ))
(if (eq system-type 'gnu/linux)
  (setq default-frame-alist '((font . "Monospace-13")))
  )

;; these functions only run once when starting a daemon
;; so they don't do much good with the ec/et workflow
;;(when window-system
;;  (message "setting up in window-system")
;;  )
;;(when (not window-system)
;;  (message "setting up in terminal")
;;)


;; editing function
; Indent and unindent by one tab length
(global-set-key (kbd "C->") 'indent-rigidly-right-to-tab-stop)
(global-set-key (kbd "C-<") 'indent-rigidly-left-to-tab-stop)
(defun end-newline-and-indent ()
  "Go to the end of the current line, then run `newline-and-indent'."
  (interactive)
  (progn
    (move-end-of-line 1)
    (newline-and-indent)))
(global-set-key [(control return)] 'end-newline-and-indent)
(defun smarter-move-beginning-of-line (arg)
  "Toggle between `beginning-of-line' and `back-to-indentation' based on ARG."
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
  "Not exactly but it's easier to remember."
  (interactive)
(set-buffer-file-coding-system 'unix 't))

;; packages
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; use-package
;; - https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; org-mode
;; - https://orgmode.org/
;; turn back on when want to update orgmode, and 
;; uncomment the `:ensure org-plus-contrib' below
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;; (setq package-archive-priorities '(("org" . 3)
;;                                   ("melpa" . 2)
;;                                   ("gnu" . 1)))
(use-package org
  ;; using org-plus-contrib is a hack to make package.el load the newer
  ;; turned off in package-archives, turn back on to load new
  ;; :ensure org-plus-contrib
  :preface
  (setq sync-git-dir-file
    (expand-file-name "bin/sync-git-dir" user-emacs-directory))
  (defun async-org-files ()
    "Use `start-process' to run `sync-git-dir-file' on `org-directory' in the background."
    (interactive)
    (progn
      (org-save-all-org-buffers)
      (message "Syncing org files in background")
      (start-process "org-sync"
        "*org-git-sync*"
        sync-git-dir-file
        (expand-file-name org-directory))
      (pop-to-buffer "*org-git-sync*")
      (delete-other-windows)))
  (defun sync-org-files ()
    "Use `call-process' to run `sync-git-dir-file' on `org-directory'."
    (interactive)
    (progn
      (org-save-all-org-buffers)
      (message "Syncing org files")
      (call-process
        sync-git-dir-file
        nil nil nil
        (expand-file-name org-directory))))
  (defun ask-to-sync-org-files ()
    "Prompt and ask whether to sync org files or not.  If 'y', then setup a shutdown hook to sync to as well"
    ;; TODO: only fix script to have lock file and only prompt if not there
    (interactive)
    (if (y-or-n-p "Sync org files? ")
      (progn
        (async-org-files)
        (add-hook 'kill-emacs-hook #'sync-org-files)
        (global-set-key (kbd "<f5>") 'async-org-files))))
  :init
  (setq org-startup-truncated nil) ; wrap lines
  (add-hook 'emacs-startup-hook #'ask-to-sync-org-files)
  ;:pin "manual"
  ;; :demand t
  )

;; org-journal
(use-package org-journal
  :ensure nil
  :custom
  (org-journal-file-format "%Y%m%d.org")
  (org-journal-dir (expand-file-name "journal" org-directory))
  )

;; ensure system package
;; - part of use-package at https://github.com/jwiegley/use-package
(use-package use-package-ensure-system-package
  :ensure nil
  )

;; help setup paths
;; - https://github.com/purcell/exec-path-from-shell
;;(use-package exec-path-from-shell
;;  :ensure nil
;;  :config
;;  (when (memq window-system '(mac ns))
;;    (exec-path-from-shell-initialize)))

;; diminish
;; - https://github.com/myrjola/diminish.el
(use-package diminish
  :ensure nil
  :defer 1)

(use-package ivy
  :ensure nil
  :init
  (require 'recentf)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  ;; change the dark blue background of the current match
  (set-face-attribute 'ivy-current-match nil
    :background "#ffc911"
    :foreground "#1c1c1c"
    ;; :background "#dddddd"
    ;; :foreground "#000000"
    )
  (global-set-key (kbd "C-c r") 'ivy-resume)
  )

(use-package swiper
  :ensure nil
  :config
  (global-set-key "\C-s" 'swiper))

(use-package counsel
  :ensure nil
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-m") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-x f") 'counsel-recentf)
  (global-set-key (kbd "C-c f") 'counsel-describe-function)
  (global-set-key (kbd "C-c v") 'counsel-describe-variable)
  ;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
  ;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "C-c u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  ;; (global-set-key (kbd "C-c a") 'counsel-ag)
  (global-set-key (kbd "C-c l") 'counsel-locate)
  ;;(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  )

;; hippie expand - built in
(use-package hippie-expand
  :init
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
  :config
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
  :bind
  (("C-<tab>" . hippie-expand)))

;; git - built in
(use-package vc-git
  :config
  (use-package vc-dir)
  )

;; eshell - all built in except
;; - https://github.com/Fuco1/eshell-bookmark
(use-package eshell
  :commands eshell
  :config
  (use-package em-prompt
    :after vc-git
    :preface
    (defun better-eshell-prompt ()
      (concat
        (propertize
          (concat user-login-name "@"
            (car (split-string (system-name) "\\.")))
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
    :config
    (setq
      eshell-highlight-prompt nil
      eshell-prompt-regexp "^[^#$]*[#$] "
      eshell-prompt-function 'better-eshell-prompt))
  (use-package em-hist
    :config
    (setq
      eshell-save-history-on-exit t
      eshell-history-size 1024))
  (use-package em-cmpl
    :config
    (setq
      eshell-cmpl-cycle-completions nil
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'"))
  (use-package em-term
    :config
    (setq
      eshell-visual-commands '("less" "top" "vim")
      eshell-visual-subcommands '(("git" "log" "diff" "di" "show"))))
  (use-package eshell-bookmark
    :ensure nil
    :config
    (add-hook 'eshell-mode-hook 'eshell-bookmark-setup))
  (defalias 'ff 'find-file)
  (defalias 'd 'dired)
  (defalias 'fo 'find-file-other-window))

;; speedbar - built in
(use-package speedbar
  :config
  (progn
    (set-variable 'speedbar-use-images nil)
    (set-variable 'speedbar-show-unknown-files t)
    (set-variable 'speedbar-update-flag nil)
    ))


(use-package project
  :bind
  (
    ; ("<f6>" . vc-git-grep)
    ("<f6>" . counsel-git-grep) ;; faster
    ; ("<f7>" . project-find-file)
    ("<f7>" . counsel-git) ;; faster
    ("<f8>" . speedbar)
    ("<f9>" . vc-dir)
    ("<f10>" . eshell))
  )

;; ctags
;; - https://github.com/jixiuf/ctags-update
;; (use-package ctags-update
;;   :ensure nil
;;)

;; etags select
;; - in site-lisp from
;; https://www.emacswiki.org/emacs/download/etags-select.el
;; (use-package etags-select
;;   :preface
;;   ;; from https://www.emacswiki.org/emacs/EtagsSelect#toc3
;;   (defun my-ido-find-tag ()
;;     "Find a tag using ido"
;;     (interactive)
;;     (tags-completion-table)
;;     (let (tag-names)
;;       (mapatoms (lambda (x)
;;                   (push (prin1-to-string x t) tag-names))
;;         tags-completion-table)
;;       (etags-select-find (ido-completing-read "Tag: " tag-names))))
;;   ;;:bind (("M-.") 'my-ido-find-tag)
;;   )

;; company mode
;; - https://github.com/company-mode/company-mode
(use-package company
  :ensure nil
  :init (global-company-mode)
  :config
  (progn
    ;; Use Company for completion
    (bind-key [remap completion-at-point] #'company-complete company-mode-map)
    (set-variable 'company-dabbrev-downcase nil)))

;; flycheck
;; - https://www.flycheck.org/en/latest/
(use-package flycheck
  :ensure nil
  :init (global-flycheck-mode))

;; Language Specific

;; Java
;; - https://github.com/jdee-emacs/jdee
(use-package jdee
  :ensure nil
  :defer t
  :config
  (custom-set-variables
    '(jdee-server-dir
       (expand-file-name "src/jdee-server" user-emacs-directory))))
(use-package autodisass-java-bytecode
  :ensure nil
)

;; Javascript
;; - https://github.com/mooz/js2-mode
;; - https://github.com/joshwnj/json-mode
(use-package js2-mode
  :ensure nil
  :mode "\\.js\\'"
  :interpreter "node"
  :init
  (setq js-indent-level 2) ;; defalias js2-basic-off in > 25.0
  :config
  (use-package json-mode
    :ensure nil
    ))

;; Typescript
;; - https://github.com/ananthakumaran/typescript.el
;; - https://github.com/ananthakumaran/tide
;; - https://github.com/AdamNiederer/ng2-mode
(use-package typescript-mode
  :ensure nil
  :defer t
  :init
  (setf typescript-indent-level js-indent-level)
  :config
  (use-package ng2-mode
    :ensure nil
    )
  (use-package tide
    :ensure nil
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
  :ensure nil
  :init
  (setq
    python-indent-offset 4
    python-shell-interpreter "ipython"
    python-shell-interpreter-args "--simple-prompt")
  :config
  (use-package conda
    :ensure nil
    :init
    (setq conda-anaconda-home "~/anaconda3")
    :config
    (conda-env-initialize-interactive-shells)
    (conda-env-initialize-eshell))
  (use-package ein
    :ensure nil
    :init
    (set-variable 'ein:jupyter-default-notebook-directory "~/git/jupyter")
    (set-variable 'ein:jupyter-default-server-command "~/anaconda3/bin/jupyter")
    (set-variable 'ein:jupyter-server-args (list "--no-browser")))
  (use-package py-autopep8
    :ensure-system-package (autopep8 . "conda install autopep8")
    :ensure nil
    :hook ((python-mode . py-autopep8-enable-on-save)))
  :hook
  ((python-mode . anaconda-mode)
    (python-mode . anaconda-eldoc-mode)))

;; golang
;; - https://github.com/dominikh/go-mode.el (guru and rename too)
;; - https://github.com/syohex/emacs-go-eldoc
;; - https://github.com/nlamirault/gotest.el
;; derived from
;; https://github.com/mswift42/.emacs.d/blob/master/init.el
;; and
;; https://zzamboni.org/post/my-emacs-configuration-with-commentary/
;; and
;; http://www.tomcraven.io/post/my-go-development-environment/
;; and
;; https://github.com/hraberg/.emacs.d/blob/master/init.el
(use-package go-mode
  ;; go get -u -v golang.org/x/tools/cmd/goimports
  ;; go get -u -v github.com/rogpeppe/godef
  ;; go get -u -v https://github.com/zmb3/gogetdoc
  :ensure nil
  :config
  (setq
    gofmt-command "goimports"
    ;; https://github.com/dominikh/go-mode.el/issues/262
    godoc-at-point-function 'godoc-gogetdoc
    imenu-generic-expression
    '(("type" "^type *\\([^ \t\n\r\f]*\\)" 1)
       ("func" "^func *\\(.*\\) {" 1)))
  (speedbar-add-supported-extension ".go")
  :bind
  (:map go-mode-map
    ([remap find-tag] . godef-jump)
    ("C-c d" . godoc-at-point)
    ("C-c g" . godoc))
  :hook
  ((go-mode . electric-pair-mode)
         (before-save . gofmt-before-save)))
(use-package go-guru
  ;; go get -u -v golang.org/x/tools/cmd/guru
  :ensure nil
  :config
  (go-guru-hl-identifier-mode)
  :bind
  (:map go-mode-map
    ("M-." . go-guru-definition)
    ("C-c h" . go-guru-hl-identifier)))
(use-package go-rename
  ;; go get -u -v golang.org/x/tools/cmd/gorename
  :ensure nil
  )
(use-package go-eldoc
  ;; go get -u -v github.com/mdempsky/gocode
  :ensure nil
  :hook
  ((go-mode . go-eldoc-setup)))
; flycheck just works
(use-package company-go
  ;; - https://github.com/mdempsky/gocode/tree/master/emacs-company
  :ensure nil
  ;; go get -u -v github.com/mdempsky/gocode if not already
  :config
  (set (make-local-variable 'company-backends)
    '(company-go))
  (add-hook
    'go-mode-hook
    (lambda ()
      (set (make-local-variable 'company-backends) '(company-go))
      (company-mode))))
(use-package gotest
  :ensure nil
  :bind
  (:map go-test-mode-map
    ("C-c ," . go-test-current-file)
    ("C-c C-," . go-test-current-file)
    ))

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

;; ruby - built in
;; - https://github.com/senny/rvm.el
;; - https://github.com/fxbois/web-mode
;; - https://github.com/nonsequitur/inf-ruby
;; derived from
;; https://github.com/howardabrams/dot-files/blob/master/emacs-ruby.org
(use-package ruby-mode
  :mode "\\.rb\\'"
  :mode "Rakefile\\'"
  :mode "Gemfile\\'"
  :mode "Berksfile\\'"
  :mode "Vagrantfile\\'"
  :interpreter "ruby"
  :init
  (setq ruby-indent-level 2
    ruby-indent-tabs-mode nil)
  :config
  (use-package rvm
    :ensure nil
    :config
    (rvm-use-default))
  (use-package web-mode
    :ensure nil
    :mode "\\.erb\\'")
  (use-package inf-ruby
    :ensure nil
    :init
    (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)))

;; elisp - built in
(use-package emacs-lisp-mode
  :init
  (setq lisp-indent-offset 2)
  :config
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
;; - https://ess.r-project.org/
(use-package ess
  :ensure nil
  :defer t
  ;;:init (require 'ess-site)
  )

;; docker setup derived from
;; http://manuel-uberti.github.io/emacs/2017/10/19/docker/
;; - https://github.com/spotify/dockerfile-mode
(use-package dockerfile-mode
  :ensure nil
  )
;; - https://github.com/meqif/docker-compose-mode
(use-package docker-compose-mode
  :ensure nil
  )
;; - https://github.com/emacs-pe/docker-tramp.el
(use-package docker-tramp
  :ensure nil
  )

;; thrift
;; - https://github.com/davidmiller/thrift-mode
(use-package thrift
  :ensure nil
  )

;; protobuf
;; - https://melpa.org/#/protobuf-mode
;; which points inside https://github.com/protocolbuffers/protobuf
(use-package protobuf-mode
  :ensure nil
  )

;; jflex
;; in site-lisp from http://jflex.de/jflex-mode.el
(use-package jflex-mode)

;; make/cmake
;; - https://melpa.org/#/cmake-mode
;; which points inside https://github.com/Kitware/CMake/
(use-package cmake-mode
  :ensure nil
  )

;; gradle
;; - https://github.com/jacobono/emacs-gradle-mode
;;(use-package gradle-mode
;;  :ensure nil
;;  :init
;;  (setq gradle-use-gradlew 1))

;; my-gradle
;; - copied from elpa dir with emacs-gradle-mode above
(use-package my-gradle-mode
  :init
  (set-variable 'gradle-use-gradlew 1))
(use-package flycheck-gradle
  :ensure nil
  :commands (flycheck-gradle-setup)
  :init
  (mapc
   (lambda (x)
     (add-hook x #'flycheck-gradle-setup))
   '(java-mode-hook kotlin-mode-hook)))


;; julia
;; - https://github.com/JuliaEditorSupport/julia-emacs
(use-package julia-mode
  :ensure nil
  )

;; scala
;; - https://github.com/ensime/emacs-scala-mode
(use-package scala-mode
  :ensure nil
  )

;; clojure
;; - https://github.com/clojure-emacs/clojure-mode
(use-package clojure-mode
  :ensure nil
  )

;; markdown
;; - https://github.com/jrblevin/markdown-mode
(use-package markdown-mode
  :ensure nil
  )

;; kotlin
;; - https://github.com/Emacs-Kotlin-Mode-Maintainers/kotlin-mode
(use-package kotlin-mode
  :ensure nil
  )

;; lua
;; - https://github.com/immerrr/lua-mode
(use-package lua-mode
  :ensure nil
  )

;; groovy
;; - https://github.com/Groovy-Emacs-Modes/groovy-emacs-modes
(use-package groovy-mode
  :ensure nil
  :config
  (setq groovy-indent-offset 2))

;; yaml
;; - https://github.com/yoshiki/yaml-mode
(use-package yaml-mode
  :ensure nil
  )

;; TODO

;; Use bind-key instead of define-key or global-set-key
;; so that I can M-x describe-personal-keybindings
;; part of use-package so already there

;; setup a var for :ensure nil

;; Use diminish to clean up mode line

;; better understand `.dir-locals.el'

;; try lsp stuff again, couldn't get it working first time around

;; change all :`ensure nil' to  :`ensure t' so packages
;; dont update automatically.  The nil is default but it allows
;; me to search and replace

;; better understand and use etags, ctags and global tags
;; and update scripts since `find-tag' has been replaced
;; by `xref-find-definitions'

;; make startup faster
;; https://www.emacswiki.org/emacs/ProfileDotEmacs
;; Look at getting rid of exec-path-from-shell as it is slow
;; It is not needed on Linux and I think this Mac version also
;; gets the path right https://bitbucket.org/mituharu/emacs-mac/overview
;; Another tool https://github.com/dholm/benchmark-init-el

;; Update README, change to README.md or README.org
;; Update dotfiles repo


(provide 'init)
;;; init.el ends here
