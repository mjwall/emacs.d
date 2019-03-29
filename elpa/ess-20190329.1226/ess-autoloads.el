;;; ess-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ess" "ess.el" (0 0 0 0))
;;; Generated autoloads from ess.el

(autoload 'ess-version "ess" "\
Return a string with ESS version information.\n\n(fn)" t nil)

(autoload 'ess-submit-bug-report "ess" "\
Submit a bug report to the ESS maintainers.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess" '("ess")))

;;;***

;;;### (autoloads nil "ess-bugs-d" "ess-bugs-d.el" (0 0 0 0))
;;; Generated autoloads from ess-bugs-d.el

(autoload 'ess-bugs-mode "ess-bugs-d" "\
Major mode for BUGS.\n\n(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.[Bb][Uu][Gg]\\'" . ess-bugs-mode))

(add-to-list 'auto-mode-alist '("\\.[Bb][Oo][Gg]\\'" . ess-bugs-mode))

(add-to-list 'auto-mode-alist '("\\.[Bb][Mm][Dd]\\'" . ess-bugs-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-bugs-d" '("ess-")))

;;;***

;;;### (autoloads nil "ess-bugs-l" "ess-bugs-l.el" (0 0 0 0))
;;; Generated autoloads from ess-bugs-l.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-bugs-l" '("ess-bugs-")))

;;;***

;;;### (autoloads nil "ess-custom" "ess-custom.el" (0 0 0 0))
;;; Generated autoloads from ess-custom.el
 (put 'ess-style 'safe-local-variable #'symbolp)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-custom" '("ess-" "inferior-" "comint-highlight-prompt" "S+" "S-" "R-")))

;;;***

;;;### (autoloads nil "ess-gretl" "ess-gretl.el" (0 0 0 0))
;;; Generated autoloads from ess-gretl.el

(autoload 'ess-gretl-mode "ess-gretl" "\
Major mode for editing gretl source.  See `ess-mode' for more help.\n\n(fn)" t nil)

(autoload 'gretl "ess-gretl" "\
Call 'gretl',\nOptional prefix (C-u) allows to set command line arguments, such as\n--vsize.  This should be OS agnostic.\nIf you have certain command line arguments that should always be passed\nto gretl, put them in the variable `inferior-gretl-args'.\n\n(fn &optional START-ARGS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-gretl" '("ess-gretl-" "inferior-gretl-args" "gretl-")))

;;;***

;;;### (autoloads nil "ess-help" "ess-help.el" (0 0 0 0))
;;; Generated autoloads from ess-help.el

(autoload 'ess-display-help-on-object "ess-help" "\
Display documentation for OBJECT.\nIf prefix arg is given, force an update of the cached help topics\nand query the ESS process for the help file instead of reusing an\nexisting buffer if it exists. Uses the variable\n`inferior-ess-help-command' for the actual help command. Prompts\nfor the object name based on the cursor location for all cases\nexcept the S-Plus GUI. With S-Plus on Windows (both GUI and in an\ninferior Emacs buffer) the GUI help window is used. If COMMAND is\nsuplied, it is used instead of `inferior-ess-help-command'.\n\n(fn OBJECT &optional COMMAND)" t nil)

(defalias 'ess-help 'ess-display-help-on-object)

(autoload 'ess-goto-info "ess-help" "\
Display node NODE from `ess-mode' info.\n\n(fn NODE)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-help" '("ess-")))

;;;***

;;;### (autoloads nil "ess-inf" "ess-inf.el" (0 0 0 0))
;;; Generated autoloads from ess-inf.el

(autoload 'ess-load-file "ess-inf" "\
Load FILENAME into an inferior ESS process.\nThis handles Tramp when working on a remote.\n\n(fn &optional FILENAME)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-inf" '("ess-" "inferior-ess" "update-ess-process-name-list" "with-ess-process-buffer")))

;;;***

;;;### (autoloads nil "ess-jags-d" "ess-jags-d.el" (0 0 0 0))
;;; Generated autoloads from ess-jags-d.el

(autoload 'ess-jags-mode "ess-jags-d" "\
Major mode for JAGS.\n\n(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.[Jj][Aa][Gg]\\'" . ess-jags-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-jags-d" '("ess-jags-")))

;;;***

;;;### (autoloads nil "ess-julia" "ess-julia.el" (0 0 0 0))
;;; Generated autoloads from ess-julia.el

(autoload 'ess-julia-mode "ess-julia" "\
Major mode for julia files.\n\n(fn)" t nil)

(autoload 'julia "ess-julia" "\
Start an inferior julia process.\nOptional prefix START-ARGS (\\[universal-argument]) allows to set\ncommand line arguments, such as --load=<file>. This should be OS\nagnostic. If you have certain command line arguments that should\nalways be passed to julia, put them in the variable\n`inferior-julia-args'.\n\n(fn &optional START-ARGS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-julia" '("ess-" "inferior-" "company-ess-julia-objects" "ac-source-ess-julia-objects")))

;;;***

;;;### (autoloads nil "ess-mode" "ess-mode.el" (0 0 0 0))
;;; Generated autoloads from ess-mode.el

(autoload 'ess-mode "ess-mode" "\
Major mode for editing ESS source.\nOptional arg ALIST describes how to customize the editing mode.\nOptional arg PROC-NAME is name of associated inferior process.\n\n\\{ess-mode-map}\n\nYou can send text to the inferior ESS process from other buffers containing\nESS source.\n    `ess-eval-region' sends the current region to the ESS process.\n    `ess-eval-buffer' sends the current buffer to the ESS process.\n    `ess-eval-function' sends the current function to the ESS process.\n    `ess-eval-line' sends the current line to the ESS process.\n    `ess-switch-to-ESS' switches the current buffer to the ESS process buffer.\n    `ess-switch-to-end-of-ESS' switches the current buffer to the ESS process\n        buffer and puts point at the end of it.\n\n    `ess-eval-region-and-go', `ess-eval-buffer-and-go',\n        `ess-eval-function-and-go', and `ess-eval-line-and-go' switch to the S\n        process buffer after sending their text.\n\n    `ess-load-file' sources a file of commands to the ESS process.\n\n\\[ess-indent-command] indents for ESS code.\n\\[backward-delete-char-untabify] converts tabs to spaces as it moves back.\nComments are indented in a similar way to Emacs-lisp mode:\n       `###'     beginning of line\n       `##'      the same level of indentation as the code\n       `#'       the same column on the right, or to the right of such a\n                 column if that is not possible.(default value 40).\n                 \\[indent-for-comment] command automatically inserts such a\n                 `#' in the right place, or aligns such a comment if it is\n                 already inserted.\n\\[ess-indent-exp] command indents each line of the syntactic unit following point.\n\nVariables controlling indentation style:\n `ess-indent-offset'\n    Indentation of ESS statements within surrounding block.\n    The surrounding block's indentation is the indentation of the line on\n    which the open-brace appears.\n `ess-offset-block'\n    Indentation of blocks opened with curly braces or anonymous parentheses.\n `ess-offset-arguments'\n    Indentation of function arguments or bracket indices.\n `ess-offset-arguments-newline'\n    Indentation of function arguments or bracket indices when the opening\n    delimiter is immediately followed by a newline.\n `ess-offset-continued'\n    Indentation style for continued statements.\n `ess-align-nested-calls'\n    Functions whose nested calls should be aligned.\n `ess-align-arguments-in-calls'\n    Calls in which arguments should be aligned.\n `ess-align-continuations-in-calls'\n    Whether ignore indentation after an operator in calls\n `ess-align-blocks'\n    Blocks that should always be aligned vertically.\n `ess-indent-from-lhs'\n    Whether function calls given as argument should be indented from the\n    parameter name.\n `ess-indent-from-chain-start'\n    Whether to indent arguments from the first of several consecutive calls.\n `ess-indent-with-fancy-comments'\n    Non-nil means distinguish between #, ##, and ### for indentation.\n\nFurthermore, \\[ess-set-style] command enables you to set up predefined ess-mode\nindentation style. See `ess-style-alist' for predefined styles.\n\n(fn)" t nil)

(autoload 'ess-dump-object-into-edit-buffer "ess-mode" "\
Edit an ESS OBJECT in its own buffer.\nWithout a prefix argument, this simply finds the file pointed to by\n`ess-source-directory'.  If this file does not exist, or if a\nprefix argument is given, a dump() command is sent to the ESS process to\ngenerate the source buffer.\n\n(fn OBJECT)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-mode" '("ess-")))

;;;***

;;;### (autoloads nil "ess-mouse" "ess-mouse.el" (0 0 0 0))
;;; Generated autoloads from ess-mouse.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-mouse" '("ess-")))

;;;***

;;;### (autoloads nil "ess-r-completion" "ess-r-completion.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from ess-r-completion.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-r-completion" '("ess-" "ac-source-R" "company-R-")))

;;;***

;;;### (autoloads nil "ess-r-flymake" "ess-r-flymake.el" (0 0 0 0))
;;; Generated autoloads from ess-r-flymake.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-r-flymake" '("ess-r-")))

;;;***

;;;### (autoloads nil "ess-r-mode" "ess-r-mode.el" (0 0 0 0))
;;; Generated autoloads from ess-r-mode.el

(defvar ess-dev-map (let (ess-dev-map) (define-prefix-command 'ess-dev-map) (define-key ess-dev-map "" 'ess-r-set-evaluation-env) (define-key ess-dev-map "s" 'ess-r-set-evaluation-env) (define-key ess-dev-map "T" 'ess-toggle-tracebug) (define-key ess-dev-map "\f" 'ess-r-devtools-load-package) (define-key ess-dev-map "l" 'ess-r-devtools-load-package) (define-key ess-dev-map "`" 'ess-show-traceback) (define-key ess-dev-map "~" 'ess-show-call-stack) (define-key ess-dev-map "" 'ess-watch) (define-key ess-dev-map "w" 'ess-watch) (define-key ess-dev-map "" 'ess-debug-flag-for-debugging) (define-key ess-dev-map "d" 'ess-debug-flag-for-debugging) (define-key ess-dev-map "" 'ess-debug-unflag-for-debugging) (define-key ess-dev-map "u" 'ess-debug-unflag-for-debugging) (define-key ess-dev-map [(control 68)] 'ess-debug-unflag-for-debugging) (define-key ess-dev-map "" 'ess-bp-set) (define-key ess-dev-map "b" 'ess-bp-set) (define-key ess-dev-map [(control 66)] 'ess-bp-set-conditional) (define-key ess-dev-map "B" 'ess-bp-set-conditional) (define-key ess-dev-map "\f" 'ess-bp-set-logger) (define-key ess-dev-map "L" 'ess-bp-set-logger) (define-key ess-dev-map "" 'ess-bp-toggle-state) (define-key ess-dev-map "o" 'ess-bp-toggle-state) (define-key ess-dev-map "" 'ess-bp-kill) (define-key ess-dev-map "k" 'ess-bp-kill) (define-key ess-dev-map "" 'ess-bp-kill-all) (define-key ess-dev-map "K" 'ess-bp-kill-all) (define-key ess-dev-map "" 'ess-bp-next) (define-key ess-dev-map "n" 'ess-bp-next) (define-key ess-dev-map "i" 'ess-debug-goto-input-event-marker) (define-key ess-dev-map "I" 'ess-debug-goto-input-event-marker) (define-key ess-dev-map "" 'ess-bp-previous) (define-key ess-dev-map "p" 'ess-bp-previous) (define-key ess-dev-map "" 'ess-debug-toggle-error-action) (define-key ess-dev-map "e" 'ess-debug-toggle-error-action) (define-key ess-dev-map "0" 'ess-electric-selection) (define-key ess-dev-map "1" 'ess-electric-selection) (define-key ess-dev-map "2" 'ess-electric-selection) (define-key ess-dev-map "3" 'ess-electric-selection) (define-key ess-dev-map "4" 'ess-electric-selection) (define-key ess-dev-map "5" 'ess-electric-selection) (define-key ess-dev-map "6" 'ess-electric-selection) (define-key ess-dev-map "7" 'ess-electric-selection) (define-key ess-dev-map "8" 'ess-electric-selection) (define-key ess-dev-map "9" 'ess-electric-selection) (define-key ess-dev-map "?" 'ess-tracebug-show-help) ess-dev-map) "\
Keymap for commands related to development and debugging.")

(autoload 'run-ess-r "ess-r-mode" "\
Call 'R', the 'GNU S' system from the R Foundation.\nOptional prefix (\\[universal-argument]) allows to set command line arguments, such as\n--vsize.  This should be OS agnostic.\nIf you have certain command line arguments that should always be passed\nto R, put them in the variable `inferior-R-args'.\n\nSTART-ARGS can be a string representing an argument, a list of\nsuch strings, or any other non-nil value.  In the latter case, you\nwill be prompted to enter arguments interactively.\n\n(fn &optional START-ARGS)" t nil)

(defalias 'R #'run-ess-r)

(autoload 'ess-r-mode "ess-r-mode" "\
Major mode for editing R source.  See `ess-mode' for more help.\n\n(fn)" t nil)

(defalias 'R-mode 'ess-r-mode)

(defalias 'r-mode 'ess-r-mode)

(add-to-list 'auto-mode-alist '("/R/.*\\.q\\'" . ess-r-mode))

(add-to-list 'auto-mode-alist '("\\.[rR]\\'" . ess-r-mode))

(add-to-list 'auto-mode-alist '("\\.[rR]profile\\'" . ess-r-mode))

(add-to-list 'auto-mode-alist '("NAMESPACE\\'" . ess-r-mode))

(add-to-list 'auto-mode-alist '("CITATION\\'" . ess-r-mode))

(autoload 'ess-r-transcript-mode "ess-r-mode" "\
A Major mode for R transcript files.\n\n(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.[Rr]out" . ess-r-transcript-mode))

(add-to-list 'interpreter-mode-alist '("Rscript" . ess-r-mode))

(add-to-list 'interpreter-mode-alist '("r" . ess-r-mode))

(add-to-list 'auto-mode-alist '("/Makevars\\(\\.win\\)?$" . makefile-mode))

(add-to-list 'auto-mode-alist '("DESCRIPTION$" . conf-colon-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-r-mode" '("ess-" "inferior-ess-" "R-")))

;;;***

;;;### (autoloads nil "ess-r-package" "ess-r-package.el" (0 0 0 0))
;;; Generated autoloads from ess-r-package.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-r-package" '("ess-")))

;;;***

;;;### (autoloads nil "ess-r-syntax" "ess-r-syntax.el" (0 0 0 0))
;;; Generated autoloads from ess-r-syntax.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-r-syntax" '("ess-" "backward-ess-r-" "forward-ess-r-")))

;;;***

;;;### (autoloads nil "ess-r-xref" "ess-r-xref.el" (0 0 0 0))
;;; Generated autoloads from ess-r-xref.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-r-xref" '("ess-r-xref-")))

;;;***

;;;### (autoloads nil "ess-rd" "ess-rd.el" (0 0 0 0))
;;; Generated autoloads from ess-rd.el

(autoload 'Rd-mode "ess-rd" "\
Major mode for editing R documentation source files.\n\nType \\[list-abbrevs] to display the built-in abbrevs for Rd\nkeywords.To automatically turn on the abbrev(iate) features, add\nthe following to your Emacs configuration file:\n\n  (add-hook 'Rd-mode-hook #'abbrev-mode)\n\n(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.Rd\\'" . Rd-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-rd" '("Rd-" "ess-point")))

;;;***

;;;### (autoloads nil "ess-rdired" "ess-rdired.el" (0 0 0 0))
;;; Generated autoloads from ess-rdired.el

(autoload 'ess-rdired "ess-rdired" "\
Show R objects from the global environment in a separate buffer.\nYou may interact with these objects, see `ess-rdired-mode' for\ndetails.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-rdired" '("ess-rdired-")))

;;;***

;;;### (autoloads nil "ess-roxy" "ess-roxy.el" (0 0 0 0))
;;; Generated autoloads from ess-roxy.el

(autoload 'ess-roxy-mode "ess-roxy" "\
Minor mode for editing ROxygen documentation.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-roxy" '("ess-")))

;;;***

;;;### (autoloads nil "ess-rutils" "ess-rutils.el" (0 0 0 0))
;;; Generated autoloads from ess-rutils.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-rutils" '("ess-rutils-")))

;;;***

;;;### (autoloads nil "ess-s-lang" "ess-s-lang.el" (0 0 0 0))
;;; Generated autoloads from ess-s-lang.el

(add-to-list 'auto-mode-alist '("\\.[Ss]t\\'" . S-transcript-mode))

(add-to-list 'auto-mode-alist '("\\.Sout" . S-transcript-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-s-lang" '("s-" "ess-" "inferior-S-language-start")))

;;;***

;;;### (autoloads nil "ess-sas-a" "ess-sas-a.el" (0 0 0 0))
;;; Generated autoloads from ess-sas-a.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-sas-a" '("ess-" "sas-program")))

;;;***

;;;### (autoloads nil "ess-sas-d" "ess-sas-d.el" (0 0 0 0))
;;; Generated autoloads from ess-sas-d.el

(autoload 'SAS-mode "ess-sas-d" "\
Major mode for editing SAS source.  See `ess-mode' for more help.\n\n(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.[Ss][Aa][Ss]\\'" . SAS-mode))

(autoload 'SAS-menu "ess-sas-d" "\
Start SAS from the menu.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-sas-d" '("ess-" "SAS" "inferior-SAS-args")))

;;;***

;;;### (autoloads nil "ess-sas-l" "ess-sas-l.el" (0 0 0 0))
;;; Generated autoloads from ess-sas-l.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-sas-l" '("ess-" "set-sas-file-" "submit-sas" "switch-to-" "sas-" "beginning-of-sas-" "backward-page-top-of-window" "fix-page-breaks" "forward-page-top-of-window" "next-sas-proc" "indent-sas-statement" "SAS-")))

;;;***

;;;### (autoloads nil "ess-site" "ess-site.el" (0 0 0 0))
;;; Generated autoloads from ess-site.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-site" '("ess-")))

;;;***

;;;### (autoloads nil "ess-sp6-d" "ess-sp6-d.el" (0 0 0 0))
;;; Generated autoloads from ess-sp6-d.el

(autoload 'S+-mode "ess-sp6-d" "\
Major mode for editing S+ source.  See `ess-mode' for more help.\n\n(fn &optional PROC-NAME)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-sp6-d" '("ess-" "S+")))

;;;***

;;;### (autoloads nil "ess-stata-lang" "ess-stata-lang.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from ess-stata-lang.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-stata-lang" '("ess-" "stata-" "STA-editing-alist" "ado-set-font-lock-keywords")))

;;;***

;;;### (autoloads nil "ess-stata-mode" "ess-stata-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from ess-stata-mode.el

(autoload 'ess-stata-mode "ess-stata-mode" "\
Major mode for editing Stata source.\n\n(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.do\\'" . ess-stata-mode))

(add-to-list 'auto-mode-alist '("\\.ado\\'" . ess-stata-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-stata-mode" '("stata" "ess-" "Stata-mode" "STA-" "inferior-ess-stata-mode")))

;;;***

;;;### (autoloads nil "ess-toolbar" "ess-toolbar.el" (0 0 0 0))
;;; Generated autoloads from ess-toolbar.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-toolbar" '("ess-")))

;;;***

;;;### (autoloads nil "ess-tracebug" "ess-tracebug.el" (0 0 0 0))
;;; Generated autoloads from ess-tracebug.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-tracebug" '("ess-" "org-" "inferior-ess-")))

;;;***

;;;### (autoloads nil "ess-trns" "ess-trns.el" (0 0 0 0))
;;; Generated autoloads from ess-trns.el

(autoload 'ess-transcript-mode "ess-trns" "\
Major mode for transcript files.\n\nType \\[ess-transcript-send-command] to send a command in the\ntranscript to the current inferior process. \\[ess-transcript-copy-command]\ncopies the command but does not execute it, allowing you to edit it in\nthe process buffer first.\n\nType \\[ess-transcript-clean-region] to delete all outputs and prompts\nin the region, leaving only the commands.\n\n(fn)" t nil)

(autoload 'ess-transcript-clean-region "ess-trns" "\
Strip the transcript in the region, leaving only (R/S/Lsp/..) commands.\nDeletes any lines not beginning with a prompt, and then removes the\nprompt from those lines that remain.  Prefix argument means to\nclean even if the buffer is \\[read-only].\n\n(fn BEG END EVEN-IF-READ-ONLY)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-trns" '("ess-transcript-")))

;;;***

;;;### (autoloads nil "ess-utils" "ess-utils.el" (0 0 0 0))
;;; Generated autoloads from ess-utils.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-utils" '("ess-")))

;;;***

;;;### (autoloads nil "essd-els" "essd-els.el" (0 0 0 0))
;;; Generated autoloads from essd-els.el

(autoload 'ess-remote "essd-els" "\
Execute this command from within a buffer running a process.\nIt runs `ess-add-ess-process' to add the PROC-NAME to\n`ess-process-name-alist' and to make it the\n`ess-current-process-name'. It then prompts the user for an ESS\nlanguage and sets the editing characteristics appropriately.\n\nTo use this command, first start a process on a remote computer by\nmanual use of telnet, rlogin, ssh, or some other protocol.  Start the\nrelevant program (\"S\" or \"R\" or \"sas -stdio\") in that buffer.  Once\nyou are talking to S or R or SAS, then do \\[ess-remote] to make\nthe current buffer an inferior-ess buffer with the right behavior for\nthe language you are currently working with.  With S and R, use C-c\nC-n to send lines over.  With SAS, use C-c i\n`ess-eval-line-and-step-invisibly' to send lines over invisibly.\n\nDIALECT is the desired ess-dialect. If nil, ask for dialect\n\n(fn &optional PROC-NAME DIALECT)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "essd-els" '("ess-" "S+elsewhere" "inferior-ess-remote-pager")))

;;;***

;;;### (autoloads nil "make-regexp" "make-regexp.el" (0 0 0 0))
;;; Generated autoloads from make-regexp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "make-regexp" '("make-regexp" "regexp-span")))

;;;***

;;;### (autoloads nil "mouseme" "mouseme.el" (0 0 0 0))
;;; Generated autoloads from mouseme.el

(autoload 'mouse-me "mouseme" "\
Popup a menu of functions to run on selected string or region.\n\n(fn EVENT)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mouseme" '("mouse-me-")))

;;;***

;;;### (autoloads nil nil ("ess-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ess-autoloads.el ends here
