;;; global.el
;;
;; This file is a combination of global.el from defunkt and ESK's starter-kit-misc.el

(message "Loading global.el")

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

;; make starting size larger, very specific for my mbp and font
(set-frame-height (selected-frame) 80)
(set-frame-width (selected-frame) 120)
(set-frame-position (selected-frame) 0 0)

;; no fringe, wasted space
(set-fringe-mode 0)

;; encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")

;; fonts
(if (eq window-system 'ns)
    (set-default-font "Monaco-13"))
;;    (set-default-font "Inconsolata-14"))

(ansi-color-for-comint-mode-on)

(setq visible-bell nil
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t
      x-select-enable-clipboard t
      kill-whole-line t                 ;; delete line in one stage
      mouse-yank-at-point t             ;; paste at cursor, NOT at mouse pointer position
      next-line-add-newlines nil        ;; don't add new lines when scrolling down
      require-final-newline t           ;; end files with a newline
      safe-local-variable-values '((encoding . utf-8) (prompt-to-byte-compile))
      scroll-margin 0                   ;; do smooth scrolling, ...
      scroll-conservatively 100000      ;; ... the defaults ...
      scroll-up-aggressively 0          ;; ... are very ...
      scroll-down-aggressively 0        ;; ... annoying
      user-full-name "Michael Wall"     ;; Set name
      user-mail-address "mjwall@gmail.com" ;; Set e-mail address
      ;; set ispell to use brew installed aspell, 
      ;; http://sunny.in.th/2010/05/08/emacs-enabling-flyspell-mode-gave-an-error.html
      ispell-program-name "aspell")

;; make backspace mode work correctly
(normal-erase-is-backspace-mode 1)

;; whitespace mode, turned on by run-coding-hook      
(setq whitespace-style '(trailing lines space-before-tab indentation 
                             space-after-tab tabs newline tab-mark newline-mark)
      whitespace-line-column 100
      c-basic-indent 2
      tab-width 4
      indent-tabs-mode nil)

;;(add-to-list 'safe-local-variable-values '(lexical-binding . t))
;;(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

;; Set this to whatever browser you use
;; (setq browse-url-browser-function 'browse-url-firefox)
(setq browse-url-browser-function 'browse-default-macosx-browser)
;; (setq browse-url-browser-function 'browse-default-windows-browser)
;; (setq browse-url-browser-function 'browse-default-kde)
;; (setq browse-url-browser-function 'browse-default-epiphany)
;; (setq browse-url-browser-function 'browse-default-w3m)
;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "~/src/conkeror/conkeror")

;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; ido-mode is like magic pixie dust!
(when (> emacs-major-version 21)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-max-prospects 10))

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

;; recentf stuff
(require 'recentf)
(recentf-mode 1)


(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(defvar coding-hook nil
  "Hook that gets run on activation of any programming mode.")

(defalias 'yes-or-no-p 'y-or-n-p)
(random t) ;; Seed the random-number generator

;; Hippie expand: at times perhaps too hip
;;(delete 'try-expand-line hippie-expand-try-functions-list)
;;(delete 'try-expand-list hippie-expand-try-functions-list)

;; Backups, don't clutter up directories with files
(setq make-backup-files t ;; do make backups
      backup-by-copying t ;; and copy them here
      backup-directory-alist `(("." . ,(expand-file-name (concat dotfiles-dir "backups"))))
      version-control t
      kept-new-versions 2
      kept-old-versions 5
      delete-old-versions t)



;; nxhtml stuff
;;(setq mumamo-chunk-coloring 'submode-colored
;;      nxhtml-skip-welcome t
;;      indent-region-mode t
;;      rng-nxml-auto-validate-flag nil)

;; Associate modes with file extensions

;;(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))
;;(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
;;(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
;;(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
;;(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
;;(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?$" . js2-mode))
;;(add-to-list 'auto-mode-alist '("\\.xml$" . nxml-mode))

;;(eval-after-load 'grep
;;  '(when (boundp 'grep-find-ignored-files)
;;    (add-to-list 'grep-find-ignored-files "target")
;;    (add-to-list 'grep-find-ignored-files "*.class")))

;; Default to unified diffs
;;(setq diff-switches "-u")

;; Cosmetics
;;(set-face-background 'vertical-border "white")
;;(set-face-foreground 'vertical-border "white")

;;(eval-after-load 'diff-mode
;;  '(progn
;;     (set-face-foreground 'diff-added "green4")
;;     (set-face-foreground 'diff-removed "red3")))

;;(eval-after-load 'magit
;;  '(progn
;;     (set-face-foreground 'magit-diff-add "green3")
;;     (set-face-foreground 'magit-diff-del "red3")))

;;(eval-after-load 'mumamo
;;  '(eval-after-load 'zenburn
;;     '(ignore-errors (set-face-background
;;                      'mumamo-background-chunk-submode "gray22"))))

;; Platform-specific stuff
(when (eq system-type 'darwin)
  ;; Work around a bug on OS X where system-name is FQDN
  (setq system-name (car (split-string system-name "\\."))))

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)

;; no line numbers unless I say so, but set the format for when I do
(global-linum-mode 0)
(setq linum-format "%d ")

;; Get around the emacswiki spam protection
;;(add-hook 'oddmuse-mode-hook
;;          (lambda ()
;;            (unless (string-match "question" oddmuse-post)
;;              (setq oddmuse-post (concat "uihnscuskc=1;" oddmuse-post)))))

;; Start server for emacs client
(server-start)
