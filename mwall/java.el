;; following instructions on http://jdee.sourceforge.net/install.html
(add-to-list 'load-path (concat dotfiles-dir "vendor/jdee-2.4.0.1/lisp"))
(add-to-list 'load-path (expand-file-name "/Applications/Emacs.app/Contents/Resources/lisp/cedet"))
(load-file (expand-file-name "/Applications/Emacs.app/Contents/Resources/lisp/cedet/cedet.elc"))
(add-to-list 'load-path (concat dotfiles-dir "vendor/elib-1.0"))

(require 'jde)
;;(load-file (concat dotfiles-dir "vendor/cedet-1.0/common/cedet.el"))

;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;;(load-file "~/cedet-VERSION/common/cedet.el")


;; Enable EDE (Project Management) features
;;(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languges only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;;(add-to-list 'load-path (concat dotfiles-dir "vendor/javadee/lisp"))
;;(require 'jde)
