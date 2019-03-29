;;; tide-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "tide" "tide.el" (0 0 0 0))
;;; Generated autoloads from tide.el

(autoload 'company-tide "tide" "\
\n\n(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'tide-format-before-save "tide" "\
Before save hook to format the buffer before each save.\n\n(fn)" t nil)

(autoload 'tide-format "tide" "\
Format the current region or buffer.\n\n(fn)" t nil)

(autoload 'tide-setup "tide" "\
Setup `tide-mode' in current buffer.\n\n(fn)" t nil)

(autoload 'tide-mode "tide" "\
Minor mode for Typescript Interactive Development Environment.\n\n\\{tide-mode-map}\n\n(fn &optional ARG)" t nil)

(autoload 'tide-project-errors "tide" "\
\n\n(fn)" t nil)

(autoload 'tide-unhighlight-identifiers "tide" "\
Remove highlights from previously highlighted identifier.\n\n(fn)" nil nil)

(autoload 'tide-hl-identifier "tide" "\
Highlight all instances of the identifier under point. Removes\nhighlights from previously highlighted identifier.\n\n(fn)" t nil)

(autoload 'tide-hl-identifier-mode "tide" "\
Highlight instances of the identifier at point after a short\ntimeout.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tide" '("tide-")))

;;;***

;;;### (autoloads nil "tide-lv" "tide-lv.el" (0 0 0 0))
;;; Generated autoloads from tide-lv.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tide-lv" '("tide-lv-")))

;;;***

;;;### (autoloads nil nil ("tide-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; tide-autoloads.el ends here
