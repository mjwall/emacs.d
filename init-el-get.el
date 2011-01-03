(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t))
  (error "Please bootstrap el-get using the instructions here: http://github.com/dimitri/el-get/, then restart Emacs"))

                                        ;(setq el-get-byte-compile nil
(setq
 el-get-sources
 '(el-get
   package
   maxframe

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

   ;; things to keep me out of the terminal and in emacs
   multi-term
   dired+
   vkill
   ;;org-contrib dependency
   (:name xml-rpc :type emacswiki :features xml-rpc)
   (:name jira :type emacswiki )
   (:name org-mode :type git :url "git://repo.or.cz/org-mode.git" :load-path ("lisp" "contrib/lisp"))

   ;; addons to desktop
   revive
   session

   ;; projects
   ack
   ;; project-root saves as ShellArchive.git?a=blob_plain;hb=HEAD;f=project-root, putting in site-lisp
   ;;(:name project-root :type http :url "http://repo.or.cz/w/ShellArchive.git?a=blob_plain;hb=HEAD;f=project-root.el" :features project-root)


   ;; Lisps
   paredit
   (:name rainbow-delimiters :type emacswiki :features rainbow-delimiters)
   (:name slime :type git :url "git://sbcl.boinkor.net/slime.git" :load-path ("." "./contrib") :compile nil :load "slime-autoloads.el")
   clojure-mode
   )
 )

(el-get 'sync)

(provide 'init-el-get)
