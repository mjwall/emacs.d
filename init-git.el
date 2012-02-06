;; since I use git from the terminal in emacs with GIT_EDITOR=emacsclient, I need to close
;; the commit message when I am done.  C-x # is the command, which runs server-edit.  But
;; I do that so often, I want an easier key combo
(global-set-key "\C-c\C-w" 'server-edit)

;; revbufs from http://www.neilvandyke.org/revbufs/revbufs.el
;; most useful when git'ing in a term
(require 'revbufs)
(global-set-key [f8] 'revbufs)


(provide 'init-git)
