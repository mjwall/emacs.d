;;; bind-key-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "bind-key" "bind-key.el" (0 0 0 0))
;;; Generated autoloads from bind-key.el

(autoload 'bind-key "bind-key" "\
Bind KEY-NAME to COMMAND in KEYMAP (`global-map' if not passed).\n\nKEY-NAME may be a vector, in which case it is passed straight to\n`define-key'. Or it may be a string to be interpreted as\nspelled-out keystrokes, e.g., \"C-c C-z\". See documentation of\n`edmacro-mode' for details.\n\nCOMMAND must be an interactive function or lambda form.\n\nKEYMAP, if present, should be a keymap and not a quoted symbol.\nFor example:\n\n  (bind-key \"M-h\" #'some-interactive-function my-mode-map)\n\nIf PREDICATE is non-nil, it is a form evaluated to determine when\na key should be bound. It must return non-nil in such cases.\nEmacs can evaluate this form at any time that it does redisplay\nor operates on menu data structures, so you should write it so it\ncan safely be called at any time.\n\n(fn KEY-NAME COMMAND &optional KEYMAP PREDICATE)" nil t)

(autoload 'unbind-key "bind-key" "\
Unbind the given KEY-NAME, within the KEYMAP (if specified).\nSee `bind-key' for more details.\n\n(fn KEY-NAME &optional KEYMAP)" nil t)

(autoload 'bind-key* "bind-key" "\
Similar to `bind-key', but overrides any mode-specific bindings.\n\n(fn KEY-NAME COMMAND &optional PREDICATE)" nil t)

(autoload 'bind-keys "bind-key" "\
Bind multiple keys at once.\n\nAccepts keyword arguments:\n:map MAP               - a keymap into which the keybindings should be\n                         added\n:prefix KEY            - prefix key for these bindings\n:prefix-map MAP        - name of the prefix map that should be created\n                         for these bindings\n:prefix-docstring STR  - docstring for the prefix-map variable\n:menu-name NAME        - optional menu string for prefix map\n:filter FORM           - optional form to determine when bindings apply\n\nThe rest of the arguments are conses of keybinding string and a\nfunction symbol (unquoted).\n\n(fn &rest ARGS)" nil t)

(autoload 'bind-keys* "bind-key" "\
\n\n(fn &rest ARGS)" nil t)

(autoload 'describe-personal-keybindings "bind-key" "\
Display all the personal keybindings defined by `bind-key'.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bind-key" '("compare-keybindings" "get-binding-description" "bind-key" "personal-keybindings" "override-global-m")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; bind-key-autoloads.el ends here
