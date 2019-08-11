;; init-with-elpa.el --- Initialization file for Emacs that loads packages

;; Author: Mike Wall
;; URL: https://github.com/mjwall/emacs.d

;;; Commentary:
;; Load the init.el and then load up some packages

;;; Code:

;; load the main file
(load (expand-file-name "init.el" user-emacs-directory))

;; packages
(package-initialize)
;; https://debbugs.gnu.org/34341, fixed in 26.3
;; uncomment and C-x C-e to eval
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; use-package - https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
;; To debug any macro (including the use-package expandsion)
;; go the end of the macro, then run `eval-last-sexp' (C-x C-e) which
;; will expand that macro, then run `pp-macroexpand-last-sexp' which
;; writes the output to a new buffer
;;(setq
;;  use-package-verbose 'debug
;;  use-package-expand-minimally nil)

(require 'cl)
(require 'cc-mode)

(use-package company
  :ensure t
  )
(use-package flycheck
  :ensure t
  )
(use-package lsp-mode
  :ensure t
  :init
  (setq
   lsp-enable-snippet nil
   lsp-session-file (expand-file-name ".lsp-session-v1" temp-dir))
  )
(use-package company-lsp
  :ensure t
  )
(use-package dap-mode
  :ensure t)

;; java
;; can run the following if you need a .project
;; mvn org.apache.maven.plugins:maven-eclipse-plugin:2.10:eclipse
;; To start lsp, M-x lsp-workspace-folder-add (first time) then
;; C-u M-x lsp
;; choose jdtls
(use-package lsp-java
  :ensure t
  :after lsp
  :init  
  (setq
   lsp-java-server-install-dir (expand-file-name "site-lisp/lsp" user-emacs-directory)
   dap-java-test-runner (expand-file-name "site-lisp/lsp/eclipse.jdt.ls/test-runner/junit-platform-console-standalone.jar" user-emacs-directory)
   )
  )
;; C-u M-x lsp, choose jdtls
;;:hook
;;(java-mode .  lsp)
(use-package autodisass-java-bytecode
  :ensure t
  )

;; python
 (use-package pyenv-mode
   :ensure t
   :config
   (pyenv-mode)
   )
(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell)
  ;; note that setting `venv-location` is not necessary if you
  ;; use the default location (`~/.virtualenvs`), or if the
  ;; the environment variable `WORKON_HOME` points to the right place
  ;; (setq venv-location "/path/to/your/virtualenvs/")
                                        ;:after (pyenv-mode)
  )
(use-package python
  :ensure t
  :init
  (setq python-indent-offset 2)
  )
(use-package cython-mode
  :ensure t
  :mode (("\\.py[xdi]" . cython-mode))
  )
(use-package lsp-python-ms
  :ensure t
  :init
  (setq
   lsp-python-ms-dir (expand-file-name "site-lisp/lsp/mspyls/" user-emacs-directory)
   )
  )
;; C-u M-x lsp and choose lsp-python-ms
;; could also add auto hook
;;:hook
;;   (python-mode .
;;     (lambda () (require 'lsp-python-ms) (lsp))
;;   )

;; golang
;; - https://github.com/dominikh/go-mode.el (guru and rename too)
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
(use-package gotest
  :ensure nil
  :bind
  (:map go-test-mode-map
    ("C-c ," . go-test-current-file)
    ("C-c C-," . go-test-current-file)
    ))
;; go get golang.org/x/tools/gopls, then
;; C-u M-x lsp and select gopls

;; js2 and json

;; typescript

;; bash

;; c/c++

;; makefile

;; cmake

;; docker

;; ruby

;; nxml

;; scala

;; clojure

;; elisp

;; thrift

;; protobuf

;; groovy

;; gradle

;; jflex

(message "Loading LSP stuff")


;; ;; Javascript
;; ;; - https://github.com/mooz/js2-mode
;; ;; - https://github.com/joshwnj/json-mode
;; (use-package js2-mode
;;   :ensure nil
;;   :mode "\\.js\\'"
;;   :interpreter "node"
;;   :init
;;   (setq js-indent-level 2) ;; defalias js2-basic-off in > 25.0
;;   :config
;;   (use-package json-mode
;;     :ensure nil
;;     ))

;; ;; Typescript
;; ;; - https://github.com/ananthakumaran/typescript.el
;; ;; - https://github.com/ananthakumaran/tide
;; ;; - https://github.com/AdamNiederer/ng2-mode
;; (use-package typescript-mode
;;   :ensure nil
;;   :defer t
;;   :init
;;   (setf typescript-indent-level js-indent-level)
;;   )
;; (use-package tide
;;   :ensure nil
;;   :after (typescript-mode flycheck)
;;   :hook
;;   ((typescript-mode . tide-setup)
;;     (typescript-mode . tide-h1-identifier-mode)
;;     (before-save . tide-format-before-save)))
;; (use-package ng2-mode
;;   :ensure nil
;;   :after (typescript-mode)
;;     )

;; ;; python
;; ;; based on http://www.andrewty.com/blog/emacs-config-for-python
;; ;; - https://github.com/proofit404/anaconda-mode
;; ;; - https://github.com/proofit404/pyenv-mode
;; ;; - https://github.com/porterjamesj/virtualenvwrapper.el
;; ;; - https://github.com/millejoh/emacs-ipython-notebook
;; ;; - https://github.com/paetzke/py-autopep8.el
;; ;; - https://github.com/cython/cython/blob/caba0c0637e5b33e24597e4a547fd38d54dfdebc/Tools/cython-mode.el
;; ;; (use-package conda
;; ;;   :ensure nil
;; ;;   :preface
;; ;;   ;; https://github.com/necaris/conda.el/issues/22#issuecomment-458462342
;; ;;   (defun hack-conda--get-path-prefix (orig-fun &rest args)
;; ;;     "Hack getting a platform-specific path string to utilize the conda env in
;; ;; ENV-DIR.  It's platform specific in that it uses the platform's native path
;; ;; separator."
;; ;;     (s-trim (concat (file-name-as-directory (car args)) "bin")))
;; ;;   :init
;; ;;   (setq conda-anaconda-home "~/anaconda3")
;; ;;   :config
;; ;;   (conda-env-initialize-interactive-shells)
;; ;;   (conda-env-initialize-eshell)
;; ;;   (conda-env-autoactivate-mode t)
;; ;;   ;; monkey patch until this PR is merged
;; ;;   ;; https://github.com/necaris/conda.el/pull/23
;; ;;   (advice-add 'conda--get-path-prefix :around #'hack-conda--get-path-prefix)
;; ;;   :after (flycheck))
;; (use-package anaconda-mode
;;   :ensure nil
;;   :init
;;   (setq
;;     python-indent-offset 2
;;     ;;python-shell-interpreter "ipython"
;;     ;;python-shell-interpreter-args "--simple-prompt"
;;     )
;;   :hook
;;   ((python-mode . anaconda-mode)
;;     (python-mode . anaconda-eldoc-mode))
;;   :after (pyenv-mode)
;;   )
;; (use-package company-anaconda
;;   :ensure nil
;;   :init
;;   (add-to-list 'company-backends 'company-anaconda))
;; (use-package ein
;;   :ensure nil
;;   :init
;;   (set-variable 'ein:jupyter-default-notebook-directory "~/git/jupyter")
;;   (set-variable 'ein:jupyter-default-server-command "~/anaconda3/bin/jupyter")
;;   (set-variable 'ein:jupyter-server-args (list "--no-browser")))
;; (use-package py-autopep8
;;   :ensure-system-package (autopep8 . "pip install autopep8")
;;   :ensure nil
;;   :hook ((python-mode . py-autopep8-enable-on-save))
;;   ;;:after (pyenv-mode)
;;   )

;; ;; c/c++
;; ;; for c++ 14 look at cquery, for c++ 17 look at ccls
;; (use-package cc-mode
;;   :init
;;   (setq tab-width 2
;;     c-basic-offset 2))

;; ;; xml/html
;; (use-package nxml-mode
;;   :init
;;   (setq nxml-slash-auto-complete-flag t)
;;   (fset 'html-mode 'nxml-mode))

;; ;; ruby - built in
;; ;; - https://github.com/senny/rvm.el
;; ;; - https://github.com/fxbois/web-mode
;; ;; - https://github.com/nonsequitur/inf-ruby
;; ;; derived from
;; ;; https://github.com/howardabrams/dot-files/blob/master/emacs-ruby.org
;; (use-package ruby-mode
;;   :mode "\\.rb\\'"
;;   :mode "Rakefile\\'"
;;   :mode "Gemfile\\'"
;;   :mode "Berksfile\\'"
;;   :mode "Vagrantfile\\'"
;;   :interpreter "ruby"
;;   :init
;;   (setq ruby-indent-level 2
;;     ruby-indent-tabs-mode nil)
;;   :config
;;   (use-package rvm
;;     :ensure nil
;;     :config
;;     (rvm-use-default))
;;   (use-package web-mode
;;     :ensure nil
;;     :mode "\\.erb\\'")
;;   (use-package inf-ruby
;;     :ensure nil
;;     :init
;;     (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)))

;; ;; elisp - built in
;; (use-package emacs-lisp-mode
;;   :init
;;   (setq lisp-indent-offset 2)
;;   :config
;;   (use-package eldoc
;;     :hook ((emacs-lisp-mode . turn-on-eldoc-mode)))
;;   (use-package ert
;;     :init
;;     (add-to-list 'emacs-lisp-mode-hook 'ert--activate-font-lock-keywords))
;;   :bind (("M-." . find-function-at-point)
;;           ("M-&" . complete-symbol))
;;   :interpreter (("emacs" . emacs-lisp-mode)))

;; ;; bash - built in
;; (use-package sh-script
;;   :init
;;   (setq sh-basic-offset 2))

;; ;; octave - built in
;; (use-package octave)

;; ;; R
;; ;; - https://ess.r-project.org/
;; (use-package ess
;;   :ensure nil
;;   :defer t
;;   ;;:init (require 'ess-site)
;;   )

;; ;; docker setup derived from
;; ;; http://manuel-uberti.github.io/emacs/2017/10/19/docker/
;; ;; - https://github.com/spotify/dockerfile-mode
;; (use-package dockerfile-mode
;;   :ensure nil
;;   )
;; ;; - https://github.com/meqif/docker-compose-mode
;; (use-package docker-compose-mode
;;   :ensure nil
;;   )
;; ;; - https://github.com/emacs-pe/docker-tramp.el
;; (use-package docker-tramp
;;   :ensure nil
;;   )

;; ;; thrift
;; ;; - https://github.com/davidmiller/thrift-mode
;; (use-package thrift
;;   :ensure nil
;;   )

;; ;; protobuf
;; ;; - https://melpa.org/#/protobuf-mode
;; ;; which points inside https://github.com/protocolbuffers/protobuf
;; (use-package protobuf-mode
;;   :ensure nil
;;   )

;; ;; jflex
;; ;; in site-lisp-full from http://jflex.de/jflex-mode.el
;; (use-package jflex-mode)

;; ;; make/cmake
;; ;; - https://melpa.org/#/cmake-mode
;; ;; which points inside https://github.com/Kitware/CMake/
;; (use-package cmake-mode
;;   :ensure nil
;;   )

;; ;; gradle
;; ;; - https://github.com/jacobono/emacs-gradle-mode
;; ;;(use-package gradle-mode
;; ;;  :ensure nil
;; ;;  :init
;; ;;  (setq gradle-use-gradlew 1))

;; ;; my-gradle
;; ;; in site-lisp-full but copied from emacs-gradle-mode in elpa
;; (use-package my-gradle-mode
;;   :init
;;   (set-variable 'gradle-use-gradlew 1))
;; (use-package flycheck-gradle
;;   :ensure nil
;;   :commands (flycheck-gradle-setup)
;;   :init
;;   (mapc
;;     (lambda (x)
;;       (add-hook x #'flycheck-gradle-setup))
;;     '(java-mode-hook kotlin-mode-hook)))


;; ;; julia
;; ;; - https://github.com/JuliaEditorSupport/julia-emacs
;; (use-package julia-mode
;;   :ensure nil
;;   )

;; ;; scala
;; ;; - https://github.com/ensime/emacs-scala-mode
;; (use-package scala-mode
;;   :ensure nil
;;   )

;; ;; clojure
;; ;; - https://github.com/clojure-emacs/clojure-mode
;; (use-package clojure-mode
;;   :ensure nil
;;   )

;; ;; markdown
;; ;; - https://github.com/jrblevin/markdown-mode
;; (use-package markdown-mode
;;   :ensure nil
;;   )

;; ;; kotlin
;; ;; - https://github.com/Emacs-Kotlin-Mode-Maintainers/kotlin-mode
;; (use-package kotlin-mode
;;   :ensure nil
;;   )

;; ;; lua
;; ;; - https://github.com/immerrr/lua-mode
;; (use-package lua-mode
;;   :ensure nil
;;   )

;; ;; groovy
;; ;; - https://github.com/Groovy-Emacs-Modes/groovy-emacs-modes
;; (use-package groovy-mode
;;   :ensure nil
;;   :config
;;   (setq groovy-indent-offset 2))

;; ;; yaml
;; ;; - https://github.com/yoshiki/yaml-mode
;; (use-package yaml-mode
;;   :ensure nil
;;   )
