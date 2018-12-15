;;; dap-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "dap-hydra" "dap-hydra.el" (0 0 0 0))
;;; Generated autoloads from dap-hydra.el

(autoload 'dap-hydra "dap-hydra" "\
Run `dap-hydra/body'.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dap-hydra" '("dap-hydra")))

;;;***

;;;### (autoloads nil "dap-java" "dap-java.el" (0 0 0 0))
;;; Generated autoloads from dap-java.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dap-java" '("dap-java-")))

;;;***

;;;### (autoloads nil "dap-mode" "dap-mode.el" (0 0 0 0))
;;; Generated autoloads from dap-mode.el

(defvar dap-mode nil "\
Non-nil if Dap mode is enabled.
See the `dap-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `dap-mode'.")

(custom-autoload 'dap-mode "dap-mode" nil)

(autoload 'dap-mode "dap-mode" "\
Global minor mode for DAP mode.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dap-mode" '("dap-")))

;;;***

;;;### (autoloads nil "dap-overlays" "dap-overlays.el" (0 0 0 0))
;;; Generated autoloads from dap-overlays.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dap-overlays" '("dap-overlays-")))

;;;***

;;;### (autoloads nil "dap-python" "dap-python.el" (0 0 0 0))
;;; Generated autoloads from dap-python.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dap-python" '("dap-python--populate-start-file-args")))

;;;***

;;;### (autoloads nil "dap-ruby" "dap-ruby.el" (0 0 0 0))
;;; Generated autoloads from dap-ruby.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dap-ruby" '("dap-ruby-")))

;;;***

;;;### (autoloads nil "dap-ui" "dap-ui.el" (0 0 0 0))
;;; Generated autoloads from dap-ui.el

(defvar dap-ui-mode nil "\
Non-nil if Dap-Ui mode is enabled.
See the `dap-ui-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `dap-ui-mode'.")

(custom-autoload 'dap-ui-mode "dap-ui" nil)

(autoload 'dap-ui-mode "dap-ui" "\
Displaying DAP visuals.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dap-ui" '("dap-ui-")))

;;;***

;;;### (autoloads nil "dap-ui-repl" "dap-ui-repl.el" (0 0 0 0))
;;; Generated autoloads from dap-ui-repl.el

(autoload 'dap-ui-repl "dap-ui-repl" "\
Start a JavaScript REPL to be evaluated in the visiting browser.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dap-ui-repl" '("dap-ui-" "company-dap-ui-repl")))

;;;***

;;;### (autoloads nil nil ("dap-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; dap-mode-autoloads.el ends here
