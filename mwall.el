;;; mwall.el
;;
;; User specific loading

(message "Loading mwall.el")

;; add vendor to load-path
(add-to-list 'load-path  (concat dotfiles-dir "/vendor"))

(load "mwall/global")
(load "mwall/defuns")
(load "mwall/binding")
(load "mwall/theme")
(load "mwall/emacs-nav")
(load "mwall/lisp")
;; elisp, html, ruby, clojure, paredit, php, nxml, yaml, perl, markdown, javadoc, javascript, css  ?

;;(vendor `ack)
;;(vendor 'magit)
;;(vendor 'rinari)
;; jdee, eshell, shell
