;;; js2-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "js2-imenu-extras" "js2-imenu-extras.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from js2-imenu-extras.el

(autoload 'js2-imenu-extras-setup "js2-imenu-extras" "\
\n\n(fn)" nil nil)

(autoload 'js2-imenu-extras-mode "js2-imenu-extras" "\
Toggle Imenu support for frameworks and structural patterns.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "js2-imenu-extras" '("js2-imenu-")))

;;;***

;;;### (autoloads nil "js2-mode" "js2-mode.el" (0 0 0 0))
;;; Generated autoloads from js2-mode.el

(autoload 'js2-highlight-unused-variables-mode "js2-mode" "\
Toggle highlight of unused variables.\n\n(fn &optional ARG)" t nil)

(autoload 'js2-minor-mode "js2-mode" "\
Minor mode for running js2 as a background linter.\nThis allows you to use a different major mode for JavaScript editing,\nsuch as `js-mode', while retaining the asynchronous error/warning\nhighlighting features of `js2-mode'.\n\n(fn &optional ARG)" t nil)

(autoload 'js2-mode "js2-mode" "\
Major mode for editing JavaScript code.\n\n(fn)" t nil)

(autoload 'js2-jsx-mode "js2-mode" "\
Major mode for editing JSX code.\n\nTo customize the indentation for this mode, set the SGML offset\nvariables (`sgml-basic-offset' et al) locally, like so:\n\n  (defun set-jsx-indentation ()\n    (setq-local sgml-basic-offset js2-basic-offset))\n  (add-hook \\='js2-jsx-mode-hook #\\='set-jsx-indentation)\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "js2-mode" '("js2-")))

;;;***

;;;### (autoloads nil "js2-old-indent" "js2-old-indent.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from js2-old-indent.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "js2-old-indent" '("js2-")))

;;;***

;;;### (autoloads nil nil ("js2-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; js2-mode-autoloads.el ends here
