;;; mwall.el
;;
;; User specific loading

;; add vendor to load-path
(add-to-list 'load-path  (concat dotfiles-dir "/vendor"))


(load "mwall/global")
(load "mwall/defuns")
(load "mwall/binding")
(if (system-type-is-darwin)
    (load "mwall/darwin")
)
(load "mwall/theme")
(load "mwall/git")
(load "mwall/myshell")
(load "mwall/mydired")
(load "mwall/project")
(load "mwall/twitter")
(load "mwall/autoloads")
;;(load "mwall/java")
(load "mwall/encrypt")
(load "mwall/myorg")
