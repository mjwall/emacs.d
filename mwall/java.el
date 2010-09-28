;; following instructions on http://jdee.sourceforge.net/install.html


;; jdee mode

;;(add-to-list 'load-path (concat dotfiles-dir "/vendor/jdee-2.4.1/lisp"))
;(when (locate-library "jde")

  ;(autoload 'jde-mode "jde" "Java Development Environment for Emacs." t)
;  (require 'jde)
;  (jde-set-variables-init-value)

;  (setq auto-mode-alist
;        (cons '("\\.java\\'" . jde-mode) auto-mode-alist))

;(setq jde-web-browser "firefox")

;; This breaks flymake - looks like it overwrites project vars
;(add-hook 'jde-mode-hook 'jde-set-variables-init-value)
;(setenv "JAVA_HOME" "/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/")

;(setq jde-jdk-registry '(("1.6" . "/System/Library/Frameworks/JavaVM.framework/Versions/1.6")))
; ("1.2.2" . "c:/usr/local/share/java/sun/j2se/1.2.2/")))

;(setq jde-jdk '("1.6"))

;(setq jde-jdk-doc-url "C:/Program\ Files/Java/jdk1.6.0_18/docs/ja/api/index.html")

;(setq jde-help-docsets
;      '(("JDK API"
;         "C:/Program\ Files/Java/jdk1.6.0_18/docs/ja/api/"
;         "browse-url-default-browser")))

;; BeanShell
;(setq bsh-jar (concat dotfiles-dir "/vendor/jdee-2.4.1/java/lib/bsh.jar"))

;; Compiler
;; The old fashioned normal compiler
;(setq jde-compiler '("javac server" ""))
;(require 'jde-ecj-flymake)
;; I need to learn elisp then make this work!
;(setq jde-compiler '(("eclipse java compiler server" ((concat dotfiles-dir "/vendor/jdee/java/lib/ecj.jar")) )))
;(setq jde-compiler '(("eclipse java compiler server" "/Users/mwall@texeltek.com/.emacs.d/vendor/jdee-2.4.1/java/lib/ecj.jar" )))
;; Use this for troubleshooting flymake
;(setq flymake-log-level 3)
 ;(push '(".+\\.java$"
 ;jde-ecj-server-flymake-init ;; This is not working - looks like it's parsing the beanshell prompt:
;  jde-ecj-flymake-init
;  jde-ecj-flymake-cleanup)
;  flymake-allowed-file-name-masks))
;; Auto start flymake
;(add-hook 'jde-mode-hook
;          (lambda ()
;            (when (and buffer-file-name
;                       (file-writable-p
;                        (file-name-directory buffer-file-name))
;                       (file-writable-p buffer-file-name))
;              (local-set-key (kbd "C-c d")
;                             'flymake-display-err-menu-for-current-line)
;              (flymake-mode t))))
;; Doesn't work..
;(setq jde-newline-function '(newline-and-indent))





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


;; This .emacs file illustrates the minimul setup
;; required to run the JDE.

;; Set the debug option to enable a backtrace when a
;; problem occurs.
;(setq debug-on-error t)

;; Update the Emacs load-path to include the path to
;; the JDE and its require packages. This code assumes
;; that you have installed the packages in the emacs/site
;; subdirectory of your home directory.

;;(add-to-list 'load-path (concat dotfiles-dir "vendor/jdee-2.4.1/lisp"))
;;(add-to-list 'load-path (expand-file-name "/Applications/Emacs.app/Contents/Resources/lisp/cedet"))
;;(add-to-list 'load-path (concat dotfiles-dir "vendor/elib-1.0"))

;; Initialize CEDET.
;;(load-file (expand-file-name "/Applications/Emacs.app/Contents/Resources/lisp/cedet/cedet.elc"))

; cedet
;;(when (locate-library "cedet")
;;  (setq semantic-load-turn-everything-on t)
;;  (load "inversion")
;;  (load "cedet"))

;; semantic
;;(when (locate-library "semantic")
;;  (setq semanticdb-default-save-directory (expand-file-name (concat dotfiles-dir "/.emacs.d/semanticdb")))
;;  (setq semanticdb-default-system-save-directory (expand-file-name (concat dotfiles-dir "/.emacs.d/semanticdb")))
;;  (setq semantic-load-turn-everything-on t)
;;  )




;; If you want Emacs to defer loading the JDE until you open a
;; Java file, edit the following line
;(setq defer-loading-jde nil)
;; to read:
;;
;(setq defer-loading-jde t)
;;

;(if defer-loading-jde
;    (progn
;      (autoload 'jde-mode "jde" "JDE mode." t)
;      (setq auto-mode-alist
;	    (append
;	     '(("\\.java\\'" . jde-mode))
;	     auto-mode-alist)))
;  (require 'jde))


;; Sets the basic indentation for Java source files
;; to two spaces.
;(defun my-jde-mode-hook ()
;  (setq c-basic-offset 2))

;(add-hook 'jde-mode-hook 'my-jde-mode-hook)

;; Include the following only if you want to run
;; bash as your shell.

;; Setup Emacs to run bash as its primary shell.
;;(setq shell-file-name "bash")
;;(setq shell-command-switch "-c")
;;(setq explicit-shell-file-name shell-file-name)
;;(setenv "SHELL" shell-file-name)
;;(setq explicit-sh-args '("-login" "-i"))
;(if (boundp 'w32-quote-process-args)
;  (setq w32-quote-process-args ?\")) ;; Include only for MS Windows.
;;(load "jde-autoload")
