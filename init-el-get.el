(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t))
  (error "Please bootstrap el-get using the instructions here: http://github.com/dimitri/el-get/, then restart Emacs"))

(setq el-get-byte-compile nil
      el-get-sources
      '(el-get
        package

        ;; Editing util packages
        (:name diminish :type http :url "http://www.eskimo.com/~seldon/diminish.el")
        (:name autopair :type svn :url "http://autopair.googlecode.com/svn/trunk/")
        (:name undo-tree :type git :url "http://www.dr-qubit.org/git/undo-tree.git")

        ;; ido extra packages
        smex
        ido-hacks

	;;multi-term
	;; Lisps
	;;(:name slime :type git :url "git://sbcl.boinkor.net/slime.git" :load-path ("." "./contrib") :compile nil :load "slime-autoloads.el")
	)
)

(el-get 'sync)

(provide 'init-el-get)
