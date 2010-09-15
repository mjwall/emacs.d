;; add emacs-nav, cloned from hg clone https://emacs-nav.googlecode.com/hg/ emacs-nav
(add-to-list 'load-path (concat dotfiles-dir "/vendor/emacs-nav"))
(require 'nav)

;; emacs-nav
(when (fboundp 'nav)
  (global-set-key (kbd "C-c n") 'nav-toggle))
