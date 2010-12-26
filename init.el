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

(require 'init-exec-path)
(require 'init-el-get)

(require 'init-util)
(require 'init-global)
(require 'init-binding)
(require 'init-window)


(require 'init-whitespace)


;(require 'init-hippie-expand)
;(require 'init-ido-mode)
;(require 'init-text-mode)
;(require 'init-mac-specfic)

