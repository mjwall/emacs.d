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

;; Basic
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

;; Awesome package management
(require 'init-el-get)

(require 'init-ido-extras)
(require 'init-editing-utils)
(require 'init-themes)
(require 'init-shell)
(require 'init-dired)
(require 'init-platform-specific)
(require 'init-sessions)
(require 'init-project)
(require 'init-hippie-expand)
;(require 'init-text-mode)
;(require 'init-mac-specfic)
