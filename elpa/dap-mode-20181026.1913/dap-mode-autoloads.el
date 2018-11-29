;;; dap-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "dap-hydra" "dap-hydra.el" (23552 16604 432143
;;;;;;  0))
;;; Generated autoloads from dap-hydra.el

(autoload 'dap-hydra "dap-hydra" "\
Run `dap-hydra/body'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "dap-mode" "dap-mode.el" (23552 16604 357141
;;;;;;  0))
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

;;;***

;;;### (autoloads nil "dap-ui" "dap-ui.el" (23552 16604 437142 0))
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

;;;***

;;;### (autoloads nil "dap-ui-repl" "dap-ui-repl.el" (23552 16604
;;;;;;  434149 0))
;;; Generated autoloads from dap-ui-repl.el

(autoload 'dap-ui-repl "dap-ui-repl" "\
Start a JavaScript REPL to be evaluated in the visiting browser.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("dap-java.el" "dap-mode-pkg.el" "dap-overlays.el"
;;;;;;  "dap-python.el") (23552 16604 429147 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; dap-mode-autoloads.el ends here
