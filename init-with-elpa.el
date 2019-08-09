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


;; LSP for java
(use-package lsp-mode
  :ensure t
  )
(use-package company-lsp
  :ensure t
  )
(use-package lsp-ui
  :ensure t
  )
(use-package lsp-java
  :ensure t
  :after lsp
  :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))
(use-package dap-java
  :ensure t
  :after (lsp-java))

(message "Loading LSP stuff")
