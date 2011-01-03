;; Turn off mouse interface early in startup to avoid momentary display
;; You can turn them on later if needed
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Make elisp more civilized
(require 'cl)

;; load path stuff
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/.emacs.d/site-lisp/")
           (default-directory my-lisp-dir))
      (progn
        (setq load-path (cons my-lisp-dir load-path))
        (normal-top-level-add-subdirs-to-load-path))))
(setq load-path (cons (expand-file-name "~/.emacs.d") load-path))

;; basic config
(require 'init-misc)
(require 'init-util)
(require 'init-font)
(require 'init-editing)
(require 'init-window)
(require 'init-exec-path)

;; included packages
(require 'init-ibuffer)
(require 'init-recentf)
(require 'init-ido-mode)
(require 'init-linum)
(require 'init-mail)
(require 'init-whitespace)
(require 'init-isearch)
(require 'init-hippie-expand)

;; package management
(require 'init-el-get)

;; additional config
(require 'init-ido-extras)
(require 'init-editing-utils)
(require 'init-frame-hooks)
(require 'init-gui-frames)
(require 'init-themes)
(require 'init-shell)
(require 'init-dired)
(require 'init-platform-specific)
(require 'init-sessions)
(require 'init-project)
(require 'init-org-mode)
;;TODO: figure out how to save term sessions

;; language specific configs
(require 'init-coding-hook)
(require 'init-lisp)
(require 'init-text-mode)
(require 'init-html)
(require 'init-java)
(require 'init-javascript)
;;(require 'init-ruby)

