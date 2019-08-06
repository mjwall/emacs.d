;;; sr-speedbar-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "sr-speedbar" "sr-speedbar.el" (0 0 0 0))
;;; Generated autoloads from sr-speedbar.el

(autoload 'sr-speedbar-toggle "sr-speedbar" "\
Toggle sr-speedbar window.\nToggle visibility of sr-speedbar by resizing\nthe `sr-speedbar-window' to a minimal width\nor the last width when visible.\nUse this function to create or toggle visibility\nof a speedbar-window.  It will be created if necessary.\n\n(fn)" t nil)

(autoload 'sr-speedbar-open "sr-speedbar" "\
Create `sr-speedbar' window.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sr-speedbar" '("sr-speedbar-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; sr-speedbar-autoloads.el ends here
