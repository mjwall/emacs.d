(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t))
  (error "Please bootstrap el-get using the instructions here: http://github.com/dimitri/el-get/, then restart Emacs"))

(setq el-get-byte-compile nil
      el-get-sources
      '(el-get
	;; Utilities
        package
	;;multi-term

        ;;Editing packages
        (:name diminish :type http :url "http://www.eskimo.com/~seldon/diminish.el")
        (:name autopair :type svn :url "http://autopair.googlecode.com/svn/trunk/")
        (:name undo-tree :type git :url "http://www.dr-qubit.org/git/undo-tree.git")

	;; Lisps
	;;(:name slime :type git :url "git://sbcl.boinkor.net/slime.git" :load-path ("." "./contrib") :compile nil :load "slime-autoloads.el")
	)
)

(el-get 'sync)

(provide 'init-el-get)
