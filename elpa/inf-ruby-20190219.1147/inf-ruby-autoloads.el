;;; inf-ruby-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "inf-ruby" "inf-ruby.el" (0 0 0 0))
;;; Generated autoloads from inf-ruby.el

(defvar ruby-source-modes '(ruby-mode enh-ruby-mode) "\
Used to determine if a buffer contains Ruby source code.\nIf it's loaded into a buffer that is in one of these major modes, it's\nconsidered a ruby source file by `ruby-load-file'.\nUsed by these commands to determine defaults.")

(autoload 'inf-ruby-setup-keybindings "inf-ruby" "\
Hook up `inf-ruby-minor-mode' to each of `ruby-source-modes'.\n\n(fn)" nil nil)

(autoload 'inf-ruby-minor-mode "inf-ruby" "\
Minor mode for interacting with the inferior process buffer.\n\nThe following commands are available:\n\n\\{inf-ruby-minor-mode-map}\n\n(fn &optional ARG)" t nil)

(autoload 'inf-ruby "inf-ruby" "\
Run an inferior Ruby process in a buffer.\nWith prefix argument, prompts for which Ruby implementation\n(from the list `inf-ruby-implementations') to use.\n\nIf there is a Ruby process running in an existing buffer, switch\nto that buffer. Otherwise create a new buffer.\n\n(fn &optional IMPL)" t nil)

(autoload 'run-ruby "inf-ruby" "\
Run an inferior Ruby process, input and output in a buffer.\n\nIf there is a process already running in a corresponding buffer,\nswitch to that buffer. Otherwise create a new buffer.\n\nThe consecutive buffer names will be:\n`*NAME*', `*NAME*<2>', `*NAME*<3>' and so on.\n\nCOMMAND defaults to the default entry in\n`inf-ruby-implementations'. NAME defaults to \"ruby\".\n\nRuns the hooks `comint-mode-hook' and `inf-ruby-mode-hook'.\n\nType \\[describe-mode] in the process buffer for the list of commands.\n\n(fn &optional COMMAND NAME)" t nil)

(autoload 'inf-ruby-switch-setup "inf-ruby" "\
Modify `rspec-compilation-mode' and `ruby-compilation-mode'\nkeymaps to bind `inf-ruby-switch-from-compilation' to `С-x C-q'.\n\n(fn)" nil nil)

(autoload 'inf-ruby-console-auto "inf-ruby" "\
Run the appropriate Ruby console command.\nThe command and the directory to run it from are detected\nautomatically.\n\n(fn)" t nil)

(autoload 'inf-ruby-console-zeus "inf-ruby" "\
Run Rails console in DIR using Zeus.\n\n(fn DIR)" t nil)

(autoload 'inf-ruby-console-rails "inf-ruby" "\
Run Rails console in DIR.\n\n(fn DIR)" t nil)

(autoload 'inf-ruby-console-gem "inf-ruby" "\
Run IRB console for the gem in DIR.\nThe main module should be loaded automatically.  If DIR contains a\nGemfile, it should use the `gemspec' instruction.\n\n(fn DIR)" t nil)

(autoload 'inf-ruby-auto-enter "inf-ruby" "\
Switch to `inf-ruby-mode' if the breakpoint pattern matches the current line.\n\n(fn)" nil nil)

(autoload 'inf-ruby-auto-exit "inf-ruby" "\
Return to the previous compilation mode if INPUT is a debugger exit command.\n\n(fn INPUT)" nil nil)

(autoload 'inf-ruby-console-script "inf-ruby" "\
Run custom bin/console, console or console.rb in DIR.\n\n(fn DIR)" t nil)

(autoload 'inf-ruby-console-default "inf-ruby" "\
Run Pry, or bundle console, in DIR.\n\n(fn DIR)" t nil)

(autoload 'inf-ruby-file-contents-match "inf-ruby" "\
\n\n(fn FILE REGEXP &optional MATCH-GROUP)" nil nil)
 (dolist (mode ruby-source-modes) (add-hook (intern (format "%s-hook" mode)) 'inf-ruby-minor-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "inf-ruby" '("inf-ruby-" "run-ruby-" "ruby-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; inf-ruby-autoloads.el ends here
