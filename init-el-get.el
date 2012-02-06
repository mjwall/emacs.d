(when (not (load "~/.emacs.d/el-get/el-get/el-get.el" t))
  (error "Please bootstrap el-get using the instructions here: http://github.com/dimitri/el-get/, then restart Emacs"))

(setq el-get-byte-compile nil
 el-get-sources
 '(el-get
   package
   maxframe

   ;; addons to desktop
   ;; revive (site gone, now in site-lisp)
   session

   ;; Editing util packages
   diminish
   autopair
   undo-tree
   auto-complete

   ;; ido extra packages
   smex
   ido-hacks

   ;; themes
   color-theme
   color-theme-sanityinc
   color-theme-tango-2
   color-theme-ir-black
   color-theme-zen-and-art
   ;;color-theme-zenburn
   color-theme-twilight
   color-theme-subdued
   color-theme-railscasts
   color-theme-mac-classic
   color-theme-solarized

   ;; things to keep me out of the terminal and in emacs
   multi-term
   dired-plus
   vkill
   magit
   (:name org-mode :type git :url "git://repo.or.cz/org-mode.git" :load-path ("lisp" "contrib/lisp"))

   ;; projects
   ack
   (:name projectile :type git :url "git://github.com/bbatsov/projectile.git")


   ;; Lisps
   paredit
   rainbow-delimiters
   ;;clojure-mode
   ;; slime is now in site-lisp, site is gone or something
   ;;(:name slime :type git :url "git://sbcl.boinkor.net/slime.git" :load-path ("." "./contrib") :compile nil :load "slime-autoloads.el")

   ;; other languages
   rvm
   rinari
   yaml-mode
   haml-mode
   scala-mode
   python-mode
   markdown-mode
   (:name php-mode :type svn :url "http://php-mode.svn.sourceforge.net/svnroot/php-mode/trunk/php-mode-src")
   ;;cedet ;; use for 23.1 and below
   )
 )

(el-get 'sync)

(provide 'init-el-get)
