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
   lsp-session-file (expand-file-name temp-dir ".lsp-session-v1"))
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
  ;;:hook
  ;;(java-mode .  lsp)
  )

;; python
(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp)))) 
;; golang

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
