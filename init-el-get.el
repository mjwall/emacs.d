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

        ;; themes
        color-theme
        (:name color-theme-sanityinc :type git :url "git://github.com/purcell/color-theme-sanityinc.git")
        (:name color-theme-tango-2 :type git :url "git://github.com/wfarr/color-theme-tango-2.git")
        (:name color-theme-ir-black :type git :url "git://github.com/burke/color-theme-ir-black.git")
        (:name color-theme-zen-and-art :type git :url "git://github.com/irfn/zen-and-art.git")
        (:name color-theme-zenburn :type git :url "git://github.com/emacsmirror/zenburn.git")
        (:name color-theme-twilight :type git :url "git://github.com/crafterm/twilight-emacs.git")
        (:name color-theme-subdued :type http :url "http://jblevins.org/git/misc.git/plain/color-theme-subdued.el")
        (:name color-theme-railscasts :type git :url "git://github.com/olegshaldybin/color-theme-railscasts.git")

        ;; things to keep me in emacs
	multi-term
        dired-single

        ;; addons to desktop
        (:name revive :type http :url "http://www.gentei.org/~yuuji/software/revive.el")
        session
	;; Lisps
	;;(:name slime :type git :url "git://sbcl.boinkor.net/slime.git" :load-path ("." "./contrib") :compile nil :load "slime-autoloads.el")
	)
)

(el-get 'sync)

(provide 'init-el-get)
