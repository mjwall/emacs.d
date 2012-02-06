;; not in elpa, get from http://www0.fh-trier.de/~politza/emacs/ido-hacks.el.gz and put in site-lisp.  New version on git at https://github.com/scottjad/ido-hacks when I move to emacs 24
(require 'ido-hacks)

;;----------------------------------------------------------------------------
;; ido completion in M-x
;;----------------------------------------------------------------------------
(require 'smex)
(smex-initialize)
(global-set-key "\M-x" 'smex)

(provide 'init-ido-extras)
