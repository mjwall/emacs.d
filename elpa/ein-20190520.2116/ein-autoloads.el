;;; ein-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ein-ac" "ein-ac.el" (0 0 0 0))
;;; Generated autoloads from ein-ac.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-ac" '("ein:")))

;;;***

;;;### (autoloads nil "ein-cell" "ein-cell.el" (0 0 0 0))
;;; Generated autoloads from ein-cell.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-cell" '("ein:")))

;;;***

;;;### (autoloads nil "ein-cell-edit" "ein-cell-edit.el" (0 0 0 0))
;;; Generated autoloads from ein-cell-edit.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-cell-edit" '("ein:")))

;;;***

;;;### (autoloads nil "ein-cell-output" "ein-cell-output.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from ein-cell-output.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-cell-output" '("ein:")))

;;;***

;;;### (autoloads nil "ein-classes" "ein-classes.el" (0 0 0 0))
;;; Generated autoloads from ein-classes.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-classes" '("ein:")))

;;;***

;;;### (autoloads nil "ein-company" "ein-company.el" (0 0 0 0))
;;; Generated autoloads from ein-company.el

(autoload 'ein:company-backend "ein-company" "\
\n\n(fn COMMAND &optional ARG &rest _)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-company" '("ein:comp")))

;;;***

;;;### (autoloads nil "ein-completer" "ein-completer.el" (0 0 0 0))
;;; Generated autoloads from ein-completer.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-completer" '("ein:complet")))

;;;***

;;;### (autoloads nil "ein-connect" "ein-connect.el" (0 0 0 0))
;;; Generated autoloads from ein-connect.el

(autoload 'ein:connect-to-notebook-command "ein-connect" "\
Connect to notebook.  When the prefix argument is given,\nyou can choose any notebook on your server including the ones\nnot yet opened.  Otherwise, already chose from already opened\nnotebooks.\n\n(fn &optional NOT-YET-OPENED)" t nil)

(autoload 'ein:connect-to-notebook "ein-connect" "\
Connect any buffer to notebook and its kernel.\n\n(fn NBPATH &optional BUFFER NO-RECONNECTION)" t nil)

(autoload 'ein:connect-to-notebook-buffer "ein-connect" "\
Connect any buffer to opened notebook and its kernel.\n\n(fn BUFFER-OR-NAME)" t nil)

(autoload 'ein:connect-buffer-to-notebook "ein-connect" "\
Connect BUFFER to NOTEBOOK.\n\n(fn NOTEBOOK &optional BUFFER NO-RECONNECTION)" nil nil)

(autoload 'ein:connect-to-default-notebook "ein-connect" "\
Connect to the default notebook specified by\n`ein:connect-default-notebook'.  Set this to `python-mode-hook'\nto automatically connect any python-mode buffer to the\nnotebook.\n\n(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-connect" '("ein:")))

;;;***

;;;### (autoloads nil "ein-console" "ein-console.el" (0 0 0 0))
;;; Generated autoloads from ein-console.el

(autoload 'ein:console-open "ein-console" "\
Open IPython console.\nTo use this function, `ein:console-security-dir' and\n`ein:console-args' must be set properly.\nThis function works best with the new python.el_ which is shipped\nwith Emacs 24.2 or later.  If you don't have it, this function\nopens a \"plain\" command line interpreter (comint) buffer where\nyou cannot use fancy stuff such as TAB completion.\nIt should be possible to support python-mode.el.  Patches are welcome!\n\n.. _python.el: https://github.com/fgallina/python.el\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-console" '("ein:")))

;;;***

;;;### (autoloads nil "ein-contents-api" "ein-contents-api.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from ein-contents-api.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-contents-api" '("ein:" "update-content-path" "*ein:content-hierarchy*")))

;;;***

;;;### (autoloads nil "ein-core" "ein-core.el" (0 0 0 0))
;;; Generated autoloads from ein-core.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-core" '("ein:" "*ein:")))

;;;***

;;;### (autoloads nil "ein-dev" "ein-dev.el" (0 0 0 0))
;;; Generated autoloads from ein-dev.el

(autoload 'ein:dev-insert-mode-map "ein-dev" "\
Insert mode-map into rst document.  For README.rst.\n\n(fn MAP-STRING)" nil nil)

(autoload 'ein:dev-start-debug "ein-dev" "\
Enable EIN debugging support.\nWhen the prefix argument is given, debugging support for websocket\ncallback (`websocket-callback-debug-on-error') is enabled.\n\n(fn &optional WS-CALLBACK)" t nil)

(autoload 'ein:dev-stop-debug "ein-dev" "\
Inverse of `ein:dev-start-debug'.  Hard to maintain because it needs to match start\n\n(fn)" t nil)

(autoload 'ein:dev-bug-report-template "ein-dev" "\
Open a buffer with bug report template.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-dev" '("ein:")))

;;;***

;;;### (autoloads nil "ein-events" "ein-events.el" (0 0 0 0))
;;; Generated autoloads from ein-events.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-events" '("ein:events-")))

;;;***

;;;### (autoloads nil "ein-file" "ein-file.el" (0 0 0 0))
;;; Generated autoloads from ein-file.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-file" '("ein:" "*ein:file-buffername-template*")))

;;;***

;;;### (autoloads nil "ein-helm" "ein-helm.el" (0 0 0 0))
;;; Generated autoloads from ein-helm.el

(autoload 'anything-ein-kernel-history "ein-helm" "\
Search kernel execution history then insert the selected one.\n\n(fn)" t nil)

(autoload 'helm-ein-kernel-history "ein-helm" "\
Search kernel execution history then insert the selected one.\n\n(fn)" t nil)

(autoload 'anything-ein-notebook-buffers "ein-helm" "\
Choose opened notebook using anything.el interface.\n\n(fn)" t nil)

(autoload 'helm-ein-notebook-buffers "ein-helm" "\
Choose opened notebook using helm interface.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-helm" '("ein:helm-")))

;;;***

;;;### (autoloads nil "ein-iexec" "ein-iexec.el" (0 0 0 0))
;;; Generated autoloads from ein-iexec.el

(autoload 'ein:iexec-mode "ein-iexec" "\
Instant cell execution minor mode.\nCode cell at point will be automatically executed after any\nchange in its input area.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-iexec" '("ein:iexec-")))

;;;***

;;;### (autoloads nil "ein-inspector" "ein-inspector.el" (0 0 0 0))
;;; Generated autoloads from ein-inspector.el

(autoload 'ein:inspect-object "ein-inspector" "\
\n\n(fn KERNEL OBJECT)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-inspector" '("ein:")))

;;;***

;;;### (autoloads nil "ein-ipdb" "ein-ipdb.el" (0 0 0 0))
;;; Generated autoloads from ein-ipdb.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-ipdb" '("ein:" "*ein:ipdb-")))

;;;***

;;;### (autoloads nil "ein-ipynb-mode" "ein-ipynb-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from ein-ipynb-mode.el

(autoload 'ein:ipynb-mode "ein-ipynb-mode" "\
A simple mode for ipynb file.\n\n(fn)" t nil)

(add-to-list 'auto-mode-alist '(".*\\.ipynb\\'" . ein:ipynb-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-ipynb-mode" '("ein:ipynb-parent-mode")))

;;;***

;;;### (autoloads nil "ein-jupyter" "ein-jupyter.el" (0 0 0 0))
;;; Generated autoloads from ein-jupyter.el

(autoload 'ein:jupyter-server-start "ein-jupyter" "\
Start SERVER-CMD_PATH with `--notebook-dir' NOTEBOOK-DIRECTORY.  Login after connection established unless NO-LOGIN-P is set.  LOGIN-CALLBACK takes two arguments, the buffer created by ein:notebooklist-open--finish, and the url-or-port argument of ein:notebooklist-open*.\n\nThis command opens an asynchronous process running the jupyter\nnotebook server and then tries to detect the url and password to\ngenerate automatic calls to `ein:notebooklist-login' and\n`ein:notebooklist-open'.\n\nWith \\[universal-argument] prefix arg, it will prompt the user for the path to\nthe jupyter executable first. Else, it will try to use the\nvalue of `*ein:last-jupyter-command*' or the value of the\ncustomizable variable `ein:jupyter-default-server-command'.\n\nThen it prompts the user for the path of the root directory\ncontaining the notebooks the user wants to access.\n\nThe buffer named by `ein:jupyter-server-buffer-name' will contain\nthe log of the running jupyter server.\n\n(fn SERVER-CMD-PATH NOTEBOOK-DIRECTORY &optional NO-LOGIN-P LOGIN-CALLBACK PORT)" t nil)

(defalias 'ein:run 'ein:jupyter-server-start)

(defalias 'ein:stop 'ein:jupyter-server-stop)

(autoload 'ein:jupyter-server-stop "ein-jupyter" "\
\n\n(fn &optional FORCE LOG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-jupyter" '("ein:" "*ein:")))

;;;***

;;;### (autoloads nil "ein-jupyterhub" "ein-jupyterhub.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from ein-jupyterhub.el

(autoload 'ein:jupyterhub-connect "ein-jupyterhub" "\
Log on to a jupyterhub server using PAM authentication. Requires jupyterhub version 0.8 or greater.  CALLBACK takes two arguments, the resulting buffer and the singleuser url-or-port\n\n(fn URL-OR-PORT USERNAME PASSWORD CALLBACK)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-jupyterhub" '("ein:" "*ein:jupyterhub-connections*")))

;;;***

;;;### (autoloads nil "ein-kernel" "ein-kernel.el" (0 0 0 0))
;;; Generated autoloads from ein-kernel.el

(defalias 'ein:kernel-url-or-port 'ein:$kernel-url-or-port)

(defalias 'ein:kernel-id 'ein:$kernel-kernel-id)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-kernel" '("ein:")))

;;;***

;;;### (autoloads nil "ein-kernelinfo" "ein-kernelinfo.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from ein-kernelinfo.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-kernelinfo" '("ein:kernelinfo")))

;;;***

;;;### (autoloads nil "ein-kill-ring" "ein-kill-ring.el" (0 0 0 0))
;;; Generated autoloads from ein-kill-ring.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-kill-ring" '("ein:")))

;;;***

;;;### (autoloads nil "ein-log" "ein-log.el" (0 0 0 0))
;;; Generated autoloads from ein-log.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-log" '("ein:")))

;;;***

;;;### (autoloads nil "ein-multilang" "ein-multilang.el" (0 0 0 0))
;;; Generated autoloads from ein-multilang.el

(autoload 'ein:notebook-multilang-mode "ein-multilang" "\
A mode for fontifying multiple languages.\n\n\\{ein:notebook-multilang-mode-map}\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-multilang" '("ein:" "python-imenu-format-parent-item-jump-label")))

;;;***

;;;### (autoloads nil "ein-multilang-fontify" "ein-multilang-fontify.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein-multilang-fontify.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-multilang-fontify" '("ein:mlf-")))

;;;***

;;;### (autoloads nil "ein-node" "ein-node.el" (0 0 0 0))
;;; Generated autoloads from ein-node.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-node" '("ein:")))

;;;***

;;;### (autoloads nil "ein-notebook" "ein-notebook.el" (0 0 0 0))
;;; Generated autoloads from ein-notebook.el

(defalias 'ein:notebook-name 'ein:$notebook-notebook-name)

(autoload 'ein:notebook-open "ein-notebook" "\
Returns notebook at URL-OR-PORT/PATH.\n\nNote that notebook sends for its contents and won't have them right away.\n\nAfter the notebook is opened, CALLBACK is called as::\n\n  (funcall CALLBACK notebook created)\n\nwhere `created' indicates a new notebook or an existing one.\n\n(fn URL-OR-PORT PATH &optional KERNELSPEC CALLBACK ERRBACK NO-POP)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-notebook" '("ein:" "*ein:notebook--pending-query*")))

;;;***

;;;### (autoloads nil "ein-notebooklist" "ein-notebooklist.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from ein-notebooklist.el

(autoload 'ein:notebooklist-enable-keepalive "ein-notebooklist" "\
Enable periodic calls to the notebook server to keep long running sessions from expiring.\nBy long running we mean sessions to last days, or weeks. The\nfrequency of the refresh (which is very similar to a call to\n`ein:notebooklist-open`) is controlled by\n`ein:notebooklist-keepalive-refresh-time`, and is measured in\nterms of hours. If `ein:enable-keepalive' is non-nil this will\nautomatically be called during calls to `ein:notebooklist-open`.\n\n(fn &optional URL-OR-PORT)" t nil)

(autoload 'ein:notebooklist-disable-keepalive "ein-notebooklist" "\
Disable the notebooklist keepalive calls to the jupyter notebook server.\n\n(fn)" t nil)

(autoload 'ein:notebooklist-reload "ein-notebooklist" "\
Reload current Notebook list.\n\n(fn &optional NBLIST RESYNC CALLBACK)" t nil)

(autoload 'ein:notebooklist-upload-file "ein-notebooklist" "\
\n\n(fn UPLOAD-PATH)" t nil)

(autoload 'ein:notebooklist-new-notebook "ein-notebooklist" "\
\n\n(fn URL-OR-PORT KERNELSPEC &optional CALLBACK NO-POP RETRY)" t nil)

(autoload 'ein:notebooklist-new-notebook-with-name "ein-notebooklist" "\
Upon notebook-open, rename the notebook, then funcall CALLBACK.\n\n(fn URL-OR-PORT KERNELSPEC NAME &optional CALLBACK NO-POP)" t nil)

(autoload 'ein:notebooklist-list-paths "ein-notebooklist" "\
Return all files of CONTENT-TYPE for all sessions\n\n(fn &optional CONTENT-TYPE)" nil nil)

(autoload 'ein:notebooklist-load "ein-notebooklist" "\
Load notebook list but do not pop-up the notebook list buffer.\n\nFor example, if you want to load notebook list when Emacs starts,\nadd this in the Emacs initialization file::\n\n  (add-to-hook 'after-init-hook 'ein:notebooklist-load)\n\nor even this (if you want fast Emacs start-up)::\n\n  ;; load notebook list if Emacs is idle for 3 sec after start-up\n  (run-with-idle-timer 3 nil #'ein:notebooklist-load)\n\nYou should setup `ein:url-or-port' or `ein:default-url-or-port'\nin order to make this code work.\n\nSee also:\n`ein:connect-to-default-notebook', `ein:connect-default-notebook'.\n\n(fn &optional URL-OR-PORT)" nil nil)

(autoload 'ein:notebooklist-open "ein-notebooklist" "\
This is now an alias for ein:notebooklist-login\n\n(fn URL-OR-PORT CALLBACK)" t nil)

(defalias 'ein:login 'ein:notebooklist-login)

(autoload 'ein:notebooklist-login "ein-notebooklist" "\
Deal with security before main entry of ein:notebooklist-open*.\n\nCALLBACK takes two arguments, the buffer created by ein:notebooklist-open--success\nand the url-or-port argument of ein:notebooklist-open*.\n\n(fn URL-OR-PORT CALLBACK &optional COOKIE-PLIST)" t nil)

(autoload 'ein:notebooklist-change-url-port "ein-notebooklist" "\
Update the ipython/jupyter notebook server URL for all the\nnotebooks currently opened from the current notebooklist buffer.\n\nThis function works by calling `ein:notebook-update-url-or-port'\non all the notebooks opened from the current notebooklist.\n\n(fn NEW-URL-OR-PORT)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-notebooklist" '("ein:" "render-" "generate-breadcrumbs")))

;;;***

;;;### (autoloads nil "ein-notification" "ein-notification.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from ein-notification.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-notification" '("ein:")))

;;;***

;;;### (autoloads nil "ein-org" "ein-org.el" (0 0 0 0))
;;; Generated autoloads from ein-org.el

(autoload 'ein:org-open "ein-org" "\
Open IPython notebook specified by LINK-PATH.\nThis function is to be used for FOLLOW function of\n`org-add-link-type'.\n\n(fn LINK-PATH)" nil nil)

(autoload 'ein:org-store-link "ein-org" "\
Call `org-store-link-props' when in notebook buffer.\nThis function is to be used for `org-store-link-functions'.\n\nExamples::\n\n  ipynb:(:url-or-port 8888 :name \"My_Notebook\")\n  ipynb:(:url-or-port \"http://notebook-server\" :name \"My_Notebook\")\n\nNote that spaces will be escaped in org files.\n\nAs how IPython development team supports multiple directory in\nIPython notebook server is unclear, it is not easy to decide the\nformat for notebook links.  Current approach is to use\nS-expression based (rather verbose) serialization, so that\nextending link spec without loosing backward compatibility is\neasier.  For the examples of link format in general, see Info\nnode `(org) External links' and Info node `(org) Search options'\n\n(fn)" nil nil)

(eval-after-load "org" '(if (fboundp 'org-link-set-parameters) (org-link-set-parameters "ipynb" :follow 'ein:org-open :help-echo "Open ipython notebook." :store 'ein:org-store-link) (org-add-link-type "ipynb" :follow 'ein:org-open) (add-hook 'org-store-link-functions 'ein:org-store-link)))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-org" '("ein:org-goto-link")))

;;;***

;;;### (autoloads nil "ein-output-area" "ein-output-area.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from ein-output-area.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-output-area" '("ein:")))

;;;***

;;;### (autoloads nil "ein-pager" "ein-pager.el" (0 0 0 0))
;;; Generated autoloads from ein-pager.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-pager" '("ein:pager-")))

;;;***

;;;### (autoloads nil "ein-process" "ein-process.el" (0 0 0 0))
;;; Generated autoloads from ein-process.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-process" '("ein:")))

;;;***

;;;### (autoloads nil "ein-pseudo-console" "ein-pseudo-console.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein-pseudo-console.el

(autoload 'ein:pseudo-console-mode "ein-pseudo-console" "\
Pseudo console mode.  Hit RET to execute code.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-pseudo-console" '("ein:pseudo-console-mode-map")))

;;;***

;;;### (autoloads nil "ein-python" "ein-python.el" (0 0 0 0))
;;; Generated autoloads from ein-python.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-python" '("ein:python-")))

;;;***

;;;### (autoloads nil "ein-pytools" "ein-pytools.el" (0 0 0 0))
;;; Generated autoloads from ein-pytools.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-pytools" '("ein:")))

;;;***

;;;### (autoloads nil "ein-query" "ein-query.el" (0 0 0 0))
;;; Generated autoloads from ein-query.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-query" '("ein:")))

;;;***

;;;### (autoloads nil "ein-scratchsheet" "ein-scratchsheet.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from ein-scratchsheet.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-scratchsheet" '("ein:scratchsheet")))

;;;***

;;;### (autoloads nil "ein-shared-output" "ein-shared-output.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein-shared-output.el

(autoload 'ein:shared-output-pop-to-buffer "ein-shared-output" "\
Open shared output buffer.\n\n(fn)" t nil)

(autoload 'ein:shared-output-show-code-cell-at-point "ein-shared-output" "\
Show code cell at point in shared-output buffer.\nIt is useful when the output of the cell at point is truncated.\nSee also `ein:cell-max-num-outputs'.\n\n(fn)" t nil)

(autoload 'ein:shared-output-eval-string "ein-shared-output" "\
Evaluate a piece of code.  Prompt will appear asking the code to run.\nThis is handy when you want to execute something quickly without\nmaking a cell.  If the code outputs something, it will go to the\nshared output buffer.  You can open the buffer by the command\n`ein:shared-output-pop-to-buffer'.\n\n.. ARGS is passed to `ein:kernel-execute'.  Unlike `ein:kernel-execute',\n   `:silent' is `nil' by default.\n\n(fn KERNEL CODE POPUP &rest ARGS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-shared-output" '("ein:" "*ein:shared-output*")))

;;;***

;;;### (autoloads nil "ein-skewer" "ein-skewer.el" (0 0 0 0))
;;; Generated autoloads from ein-skewer.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-skewer" '("ein:" "*ein:skewer-" "current-jupyter-cell-output")))

;;;***

;;;### (autoloads nil "ein-smartrep" "ein-smartrep.el" (0 0 0 0))
;;; Generated autoloads from ein-smartrep.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-smartrep" '("ein:smartrep-")))

;;;***

;;;### (autoloads nil "ein-subpackages" "ein-subpackages.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from ein-subpackages.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-subpackages" '("ein:completion-backend")))

;;;***

;;;### (autoloads nil "ein-timestamp" "ein-timestamp.el" (0 0 0 0))
;;; Generated autoloads from ein-timestamp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-timestamp" '("ein:timestamp-")))

;;;***

;;;### (autoloads nil "ein-traceback" "ein-traceback.el" (0 0 0 0))
;;; Generated autoloads from ein-traceback.el

(autoload 'ein:tb-show "ein-traceback" "\
Show full traceback in traceback viewer.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-traceback" '("ein:t")))

;;;***

;;;### (autoloads nil "ein-utils" "ein-utils.el" (0 0 0 0))
;;; Generated autoloads from ein-utils.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-utils" '("ein:")))

;;;***

;;;### (autoloads nil "ein-websocket" "ein-websocket.el" (0 0 0 0))
;;; Generated autoloads from ein-websocket.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-websocket" '("ein:" "fix-request-netscape-cookie-parse")))

;;;***

;;;### (autoloads nil "ein-worksheet" "ein-worksheet.el" (0 0 0 0))
;;; Generated autoloads from ein-worksheet.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein-worksheet" '("ein:" "hof-add")))

;;;***

;;;### (autoloads nil "ob-ein" "ob-ein.el" (0 0 0 0))
;;; Generated autoloads from ob-ein.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ob-ein" '("ob-ein-" "*ob-ein-sentinel*")))

;;;***

;;;### (autoloads nil "poly-ein" "poly-ein.el" (0 0 0 0))
;;; Generated autoloads from poly-ein.el
 (autoload 'poly-ein-mode "poly-ein")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "poly-ein" '("pm-" "poly-ein-" "ein:polymode")))

;;;***

;;;### (autoloads nil nil ("ein-hy.el" "ein-pkg.el" "ein.el") (0
;;;;;;  0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ein-autoloads.el ends here
