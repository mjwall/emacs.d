;;; jdee-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "beanshell" "beanshell.el" (0 0 0 0))
;;; Generated autoloads from beanshell.el

(autoload 'bsh-script-help "beanshell" "\
Display BeanShell User's Guide.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "beanshell" '("bsh" "initialize-instance")))

;;;***

;;;### (autoloads nil "efc" "efc.el" (0 0 0 0))
;;; Generated autoloads from efc.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "efc" '("exec" "efc-" "initialize-instance" "get-args" "create-buffer")))

;;;***

;;;### (autoloads nil "jcomplete" "jcomplete.el" (0 0 0 0))
;;; Generated autoloads from jcomplete.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jcomplete" '("prf2-")))

;;;***

;;;### (autoloads nil "jdee" "jdee.el" (0 0 0 0))
;;; Generated autoloads from jdee.el

(defconst jdee-version "2.4.2" "\
JDEE version number.")

(autoload 'jdee-version "jdee" "\
Get the version of JDEE.\n\n(fn)" t nil)

(autoload 'jdee-build "jdee" "\
Rebuild the entire project.\nThis command invokes the function defined by `jdee-build-function'.\n\n(fn)" t nil)

(autoload 'jdee-mode "jdee" "\
Major mode for developing Java applications.\n\\{jdee-mode-map}\n\n(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.java\\'" . jdee-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-abbrev" "jdee-abbrev.el" (0 0 0 0))
;;; Generated autoloads from jdee-abbrev.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-abbrev" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-activator" "jdee-activator.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from jdee-activator.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-activator" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-annotations" "jdee-annotations.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from jdee-annotations.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-annotations" '("c-" "jdee-annotations-setup")))

;;;***

;;;### (autoloads nil "jdee-ant" "jdee-ant.el" (0 0 0 0))
;;; Generated autoloads from jdee-ant.el

(autoload 'jdee-ant-build "jdee-ant" "\
Build the current project using Ant.  If interactive, we try to prompt the\n  user for certain variables..\n\n(fn BUILDFILE TARGET &optional INTERACTIVE-ARGS)" t nil)

(autoload 'jdee-ant-projecthelp "jdee-ant" "\
Display Ant project help for the current project.\nThis will execute the Ant program with the `-projecthelp' switch to output\navailable targets with their descriptions for the current buildfile. This\nfunction uses the same rules as `jdee-ant-build' for finding the buildfile.\n\n(fn BUILDFILE)" t nil)

(autoload 'jdee-ant-show-options "jdee-ant" "\
Show the JDE Ant Options panel.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-ant" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-archive" "jdee-archive.el" (0 0 0 0))
;;; Generated autoloads from jdee-archive.el

(autoload 'jdee-archive-which "jdee-archive" "\
Finds which archive contains FQN.\nSearch PATHS or `jdee-global-classpath' if nil.\n\nReturn:\n   nil if not found\n   \"file\" if fqn is a class file on disk\n   '(archive resource) for a file contained in an archive (JAR file).\n\n(fn FQN &optional DISP &rest PATHS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-archive" '("jdee-archive-")))

;;;***

;;;### (autoloads nil "jdee-avl-tree" "jdee-avl-tree.el" (0 0 0 0))
;;; Generated autoloads from jdee-avl-tree.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-avl-tree" '("jdee-avl-tree" "initialize-instance")))

;;;***

;;;### (autoloads nil "jdee-backend" "jdee-backend.el" (0 0 0 0))
;;; Generated autoloads from jdee-backend.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-backend" '("jdee-b")))

;;;***

;;;### (autoloads nil "jdee-bookmark" "jdee-bookmark.el" (0 0 0 0))
;;; Generated autoloads from jdee-bookmark.el

(autoload 'jdee-bookmark-visit "jdee-bookmark" "\
Visit a class by bookmark name.\n\n(fn KEY)" t nil)

(autoload 'jdee-bookmark-add "jdee-bookmark" "\
Add the current visited class as a bookmark.\n\n(fn KEY &optional FQ-CLASS)" t nil)

(autoload 'jdee-bookmark-list "jdee-bookmark" "\
List bookmarks.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-bookmark" '("jdee-bookmark-")))

;;;***

;;;### (autoloads nil "jdee-bsh" "jdee-bsh.el" (0 0 0 0))
;;; Generated autoloads from jdee-bsh.el

(autoload 'jdee-jeval "jdee-bsh" "\
Uses the JDEE's instance of the BeanShell\nJava interpreter to evaluate the Java expression EXPR.  If the\nBeanShell is not running, the JDEE starts an instance. This function\nreturns any text output by the Java interpreter's standard out or\nstandard error pipes.  If EVAL-RETURN is non-nil, this function\nreturns the result of evaluating the Java output as a Lisp\nexpression.\n\nNO-PRINT-P, if non-nil, don't wrap JAVA-STATEMENT with a `print'\ncommand yeilding the output.  This is going to need to be true\nfor most things since unless `show()' was invoked and output\nprints out, Emacs has nothing to evaluate or report.\n\n(fn JAVA-STATEMENT &optional EVAL-RETURN NO-PRINT-P)" t nil)

(autoload 'jdee-bsh-run "jdee-bsh" "\
Starts the JDEE version of the BeanShell.\n\n(fn)" nil nil)

(autoload 'jdee-bsh-quote-expr "jdee-bsh" "\
Add necessary syntax for a beanshell string (parameter) in the current\nbuffer.  This is useful for quoting a whole buffer or strings with newlines,\netc.  This gives the outside double quotes as well.\n\nNO-PARAM-P if non-nil, don't split string (surround double quotes) using string\nconcatentation.  The only way to get quotes in strings is to split them up and\nconcatenate the quote (') char using the plus (+) operator.  This doesn't do\nthis syntax change.\n\nNO-QUOTE-WRAP-P, if non-nil, don't add double quotes around the whole statement.\n\n(fn &optional START END NO-PARAM-P NO-QUOTE-WRAP-P)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-bsh" '("java-bsh-read-java-expression-history" "jdee-" "bsh-" "initialize-instance")))

;;;***

;;;### (autoloads nil "jdee-bug" "jdee-bug.el" (0 0 0 0))
;;; Generated autoloads from jdee-bug.el

(autoload 'jdee-bug-minor-mode "jdee-bug" "\
Toggle Jdee-Bug minor mode on or off.\nWith a prefix argument ARG, enable Jdee-Bug minor mode if ARG is\npositive, and disable it otherwise.  If called from Lisp, enable\nthe mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.\n\\{jdee-bug-mode-map}\n\n(fn &optional ARG)" t nil)

(autoload 'jdee-bug-debug-app "jdee-bug" "\
Runs the debugger on the application in the current source buffer.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-bug" '("jdee-" "efc-dialog-" "initialize-instance")))

;;;***

;;;### (autoloads nil "jdee-bytecode" "jdee-bytecode.el" (0 0 0 0))
;;; Generated autoloads from jdee-bytecode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-bytecode" '("jdee-bytecode" "get-bit-flags-for-byte" "do-and-advance-chars")))

;;;***

;;;### (autoloads nil "jdee-checkstyle" "jdee-checkstyle.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from jdee-checkstyle.el

(autoload 'jdee-checkstyle-customize "jdee-checkstyle" "\
Set Java style checking options.\n\n(fn)" t nil)

(autoload 'jdee-checkstyle "jdee-checkstyle" "\
Checks the Java program in the current buffer.\nThis command invokes the style checker specified by `jdee-checkstyle-class'\nwith the options specified by the JDEE customization variables\nthat begin with `jdee-checkstyle'.  If the variable\n`jdee-checkstyle-read-args' is non-nil, this command reads\nadditional compilation options from the minibuffer, with\nhistory enabled.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-checkstyle" '("jdee-checkstyle-")))

;;;***

;;;### (autoloads nil "jdee-class" "jdee-class.el" (0 0 0 0))
;;; Generated autoloads from jdee-class.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-class" '("jdee-" "append-to-list" "with-all-c")))

;;;***

;;;### (autoloads nil "jdee-classpath" "jdee-classpath.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from jdee-classpath.el

(autoload 'jdee-set-global-classpath "jdee-classpath" "\
Set the value of `jdee-global-classpath' to `CLASSPATH'.\nIt specifies the -classpath argument for the Java compiler and interpreter.\n\n(fn CLASSPATH)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-classpath" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-compile" "jdee-compile.el" (0 0 0 0))
;;; Generated autoloads from jdee-compile.el

(autoload 'jdee-set-compile-options "jdee-compile" "\
Set the compile `OPTIONS'.\nEnter the options as you would on the command line, e.g.,\n-depend -verbose.\n\n(fn OPTIONS)" t nil)

(autoload 'jdee-compile "jdee-compile" "\
Compile the Java program in the current buffer.\nThis command invokes the compiler specified by `jdee-compiler'\nwith the options specified by the JDEE customization variables\nthat begin with `jdee-compile'.  If the variable\n`jdee-read-compile-args' is non-nil, this command reads\nadditional compilation options from the minibuffer, with\nhistory enabled.  If `jdee-compiler' specifies the JDEE compile\nserver, this command uses the compile server.  Otherwise, it\nuses the compiler executable specified by `jdee-compiler' to compile.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-compile" '("jdee-" "initialize-instance" "bsh-compilation-buffer-create-native-buffer")))

;;;***

;;;### (autoloads nil "jdee-complete" "jdee-complete.el" (0 0 0 0))
;;; Generated autoloads from jdee-complete.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-complete" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-custom" "jdee-custom.el" (0 0 0 0))
;;; Generated autoloads from jdee-custom.el

(defalias 'jdee-customize-variable 'jdee-customize-option)

(autoload 'jdee-customize-option "jdee-custom" "\
Customize SYMBOL, which must be a JDEE option variable.\n\n(fn SYMBOL)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-custom" '("jdee-custom-")))

;;;***

;;;### (autoloads nil "jdee-cygwin" "jdee-cygwin.el" (0 0 0 0))
;;; Generated autoloads from jdee-cygwin.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-cygwin" '("jdee-c")))

;;;***

;;;### (autoloads nil "jdee-db" "jdee-db.el" (0 0 0 0))
;;; Generated autoloads from jdee-db.el

(autoload 'jdee-db-set-args "jdee-db" "\
Specify the arguments (except -classpath) to be passed to the debugger.\n\n(fn ARGS)" t nil)

(autoload 'jdee-db-set-app-args "jdee-db" "\
Specify the arguments to be passed to the Java application class.\n\n(fn ARGS)" t nil)

(autoload 'jdee-debug "jdee-db" "\
Run the debugger specified by `jdee-debugger' on the Java application\nwhose source resides in the current buffer. This command determines\nthe main class of the application either from the variable\n`jdee-run-application-class' or from the source in the current\nbuffer. If `jdee-run-application-class' does not specify a class, the\nmain class is assumed to be the class defined by the current source\nbuffer. This command creates a command buffer for the debug session.\n\n(fn)" t nil)

(autoload 'jdee-debug-applet "jdee-db" "\
Runs an applet in the jdb debugger. This function prompts you to enter\nthe path of an html document that displays the applet. If you\ndo not enter a path, this function next checks\nwhether `jdee-run-applet-doc' specifies a document. If so, it displays\nthat specified document. Next, it checks whether the current directory\ncontains any html files. If so, it displays the first html file that\nit finds. If if cannot find an html file, it signals an error.  This\nfunction runs appletviewer in jdb to permit debugging. On startup, it\nsets a breakpoint in the init method of the class specified by\n`jdee-run-application-class' or in the class corresponding to the Java\nfile in the current buffer.\n\n(fn &optional DOC)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-db" '("jdee-" "class-from-file-name" "initialize-instance")))

;;;***

;;;### (autoloads nil "jdee-dbo" "jdee-dbo.el" (0 0 0 0))
;;; Generated autoloads from jdee-dbo.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-dbo" '("jdee-dbo-")))

;;;***

;;;### (autoloads nil "jdee-dbs" "jdee-dbs.el" (0 0 0 0))
;;; Generated autoloads from jdee-dbs.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-dbs" '("jdee-" "initialize-instance")))

;;;***

;;;### (autoloads nil "jdee-deps" "jdee-deps.el" (0 0 0 0))
;;; Generated autoloads from jdee-deps.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-deps" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-ecj-flymake" "jdee-ecj-flymake.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from jdee-ecj-flymake.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-ecj-flymake" '("jdee-ecj-" "bsh-create-buffer" "initialize-instance" "flymake-")))

;;;***

;;;### (autoloads nil "jdee-ejb" "jdee-ejb.el" (0 0 0 0))
;;; Generated autoloads from jdee-ejb.el

(autoload 'jdee-ejb-session-bean-buffer "jdee-ejb" "\
Create a new Java buffer containing an EJB session bean class of the same name.\nThis command also creates buffers with the EJB Home and EJB Remote interfaces\nand the XML Deployment descriptor defined\nby the jdee-ejb templates.  This includes naming the files according\nto the EJB naming convention.\n\n(fn EJB-NAME)" t nil)

(autoload 'jdee-ejb-entity-bean-buffer "jdee-ejb" "\
Create a new Java buffer containing an EJB entity bean class of the same name.\nThis command also creates buffers with the EJB Home and EJB Remote interfaces\nand the XML Deployment descriptor defined\nby the jdee-ejb templates.  This includes naming the files according\nto the EJB naming convention.\n\n(fn EJB-NAME)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-ejb" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-files" "jdee-files.el" (0 0 0 0))
;;; Generated autoloads from jdee-files.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-files" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-find" "jdee-find.el" (0 0 0 0))
;;; Generated autoloads from jdee-find.el

(autoload 'jdee-find "jdee-find" "\
Find a regular expression REGEXP in all of the files in the\ncurrent JDEE project. Tests each of the following path variables\n`jdee-sourcepath', `jdee-compile-option-sourcepath',\n`jdee-compile-option-classpath', or `jdee-global-classpath' and uses the\ndirectories specified by the first path variable that has a nonnil\nvalue. The `jdee-find-case-sensitive' variable controls case\nsensitivity, `jdee-find-granularity' determines the granularity of the\nsearch (character, word, line), and `jdee-find-file-regexp' determines\nthe type of files to be searched. Use `jdee-find-dlg' if you want to\nset case sensitivity, granularity, or file types interactively. This\ncommand requires that the Unix grep and find utilities be installed on\nyour system in the Emacs command path. The Cygwin package contains\nWindows versions of both utilities.\n\n(fn &optional REGEXP)" t nil)

(autoload 'jdee-find-dlg "jdee-find" "\
Displays a dialog buffer that allows you to set all search options\ninteractively. Pressing the dialog's OK button initiates the\nsearch. Use `jdee-find' if you need to set only the expression to be\nfound and the directories to be searched and prefer using the\nminibuffer.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-find" '("jdee-find-" "efc-dialog-" "initialize-instance")))

;;;***

;;;### (autoloads nil "jdee-flycheck" "jdee-flycheck.el" (0 0 0 0))
;;; Generated autoloads from jdee-flycheck.el

(autoload 'jdee-flycheck-mode "jdee-flycheck" "\
Setup JDEE flycheck checker.\n\n(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-flycheck" '("jdee-" "initialize-instance")))

;;;***

;;;### (autoloads nil "jdee-font-lock" "jdee-font-lock.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from jdee-font-lock.el

(autoload 'jdee-font-lock-setup-keywords "jdee-font-lock" "\
Setup font lock keywords in `java-font-lock-keywords-4'.\nIf optional REBUILD flag is non-nil create a new cache of regular\nexpressions.\n\n(fn &optional REBUILD)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-font-lock" '("java-font-lock-keywords-4" "jdee-")))

;;;***

;;;### (autoloads nil "jdee-gen" "jdee-gen.el" (0 0 0 0))
;;; Generated autoloads from jdee-gen.el

(autoload 'jdee-gen-class-buffer "jdee-gen" "\
Create a new Java buffer containing a class of the same name.\nThis command inserts the class template generated by `jdee-gen-class'.\n\n(fn FILE)" t nil)

(autoload 'jdee-gen-interface-buffer "jdee-gen" "\
Create a new Java buffer containing an interface of the same name.\nThis command inserts the interface template generated by `jdee-gen-interface'.\nIt then moves the point to the location of the first method.\n\n(fn FILE)" t nil)

(autoload 'jdee-gen-console-buffer "jdee-gen" "\
Create a new Java buffer containing a console class of the same name.\nThis command inserts the class template generated by `jdee-gen-class'.\nIt then moves the point to the location to the constructor.\n\n(fn FILE)" t nil)

(autoload 'jdee-gen-bean-buffer "jdee-gen" "\
Create a new Java buffer containing a Java bean of the same name.\nThis command inserts the class template generated by `jdee-gen-bean'.\nIt then moves the point to the location of the constructor.\n\n(fn FILE)" t nil)

(autoload 'jdee-gen-jfc-app-buffer "jdee-gen" "\
Create a new Java buffer containing a JFC application class.\nThis command inserts the class template generated by `jdee-gen-jfc-app'.\nIt then moves the point to the location to the constructor.\n\n(fn FILE)" t nil)

(autoload 'jdee-gen-buffer "jdee-gen" "\
Create a new Java buffer containing a code template.\nThis command inserts the specified template at the beginning\nof the buffer.\n\n(fn TEMPLATE FILE)" t nil)

(defvar jdee-gen-equals-trailing-and-operators nil "\
Specifies whether the '&&' operators in a generated equals\nmethod are added at the end of the line or at the beginning.  If\nthis variable is t, the operator will be added at the end of the\nline, else on the next line before the comparison.  With\n`jdee-gen-equals-trailing-and-operators' set to nil:\n\n    return (a == o.a)\n	&& (b == o.b)\n	&& (s == null ? o.s == null : s.equals(o.s));\n\nOr, with `jdee-gen-equals-trailing-and-operators' set to t:\n\n    return (a == o.a) &&\n	(b == o.b) &&\n	(s == null ? o.s == null : s.equals(o.s));\n")

(custom-autoload 'jdee-gen-equals-trailing-and-operators "jdee-gen" t)

(defvar jdee-gen-equals-parens-around-expression nil "\
Specifies whether the generated equals expression should be\nsurrounded by parentheses.\nWith `jdee-gen-equals-trailing-and-operators' set to nil:\n\n    return ((a == o.a)\n	    && (b == o.b)\n	    && (s == null ? o.s == null : s.equals(o.s)));\n\nOr, with `jdee-gen-equals-trailing-and-operators' set to t:\n\n    return ((a == o.a) &&\n	    (b == o.b) &&\n	    (s == null ? o.s == null : s.equals(o.s)));\n")

(custom-autoload 'jdee-gen-equals-parens-around-expression "jdee-gen" t)

(defvar jdee-gen-equals-method-template '("'>" "(when jdee-gen-create-javadoc" "'(l \"/**\" '> 'n" "    \" * Check if this object is equal (equivalent) to another object.\" '> 'n" "    \" */\" '> 'n" "))" "(jdee-gen-method-signature \"public\" \"boolean\" \"equals\" \"Object obj\")" "(jdee-gen-electric-brace)" "\"if (obj == this) return true;\" '> 'n" "\"if ((obj == null) || !getClass().equals(obj.getClass())) return false;\" '> 'n" "'> 'n" "(jdee-gen-equals-return \"obj\" \"o\") '> 'n" "\"}\" '> 'n))") "\
*Template for creating an equals method.\nSetting this variable defines a template instantiation command\n`jdee-gen-equals-method', as a side-effect.")

(custom-autoload 'jdee-gen-equals-method-template "jdee-gen" nil)

(autoload 'jdee-gen-equals-return "jdee-gen" "\
Generate a body of an appropriate override for the\njava.lang.Object#equals(Object) function. This function gets the\nlist of member variables from`jdee-parse-get-serializable-members'.\n\nThe first optional parameter `parm-name' is the parameter name of\nthe Object argument of the equals function.  Default is \"obj\".\n\nThe second optional parameter `var-name' denotes the variable\nname used to cast the \"obj\" argument to. The default is \"o\".\n\nThe third optional parameter `class' can be a semantic tag, which\nis then used instead of the result of `semantic-current-tag'.\n\nExample:\n    class Bean {\n	int a;\n	long b;\n	String s;\n    }\n\nResult:\n    Bean o = (Bean) obj;\n\n    return (a == o.a)\n	&& (b == o.b)\n	&& (s == null ? o.s == null : s.equals(o.s));\n\nOr, with `jdee-gen-equals-trailing-and-operators' set to t:\n    Bean o = (Bean) obj;\n\n    return (a == o.a) &&\n	(b == o.b) &&\n	(s == null ? o.s == null : s.equals(o.s));\n\n(fn &optional PARM-NAME VAR-NAME CLASS SUPER-METHOD)" t nil)

(defvar jdee-gen-hashcode-method-template '("'>" "(when jdee-gen-create-javadoc" "'(l " "\"/**\" '> 'n" "\" * Calculate the hash code for this object.\" '> 'n" "\" * \" '> 'n" "\" * <p>The rules laid out in J. Blosh's Effective Java are used\" '> 'n" "\" * for the hash code calculation.</p>\" '> 'n" "\" * \" '> 'n" "\" * @return the hash code.\" '> 'n" "\" * \" '> 'n" "\" * @see java.lang.Object#hashCode\" '> 'n" "\" */\" '> 'n))" "(jdee-gen-method-signature \"public\"\"int\" \"hashCode\" nil)" "(jdee-gen-electric-brace)" "(jdee-gen-hashcode-body) '> 'n" "\"}\" '> 'n '>") "\
*Template for creating a hashCode method.\nSetting this variable defines a template instantiation command\n`jdee-gen-hashcode-method', as a side-effect.")

(custom-autoload 'jdee-gen-hashcode-method-template "jdee-gen" nil)

(autoload 'jdee-gen-hashcode-body "jdee-gen" "\
Generate a body of a hashCode function.\nThis function gets the list of member variables of the current\nclass from `jdee-parse-get-serializable-members'.\n\nThe first optional parameter `var-name' denotes the variable name used\nto calculate the hash code, the default is \"code\".\n\nThe second optional parameter `class' can be a semantic tag, which is\nthen used instead of the result of `semantic-current-tag'.\n\n(fn &optional VAR-NAME CLASS)" t nil)

(defvar jdee-gen-tostring-method-template '("'>" "(when jdee-gen-create-javadoc" "'(l " "\"/**\" '> 'n" "\" * Get a string representation of this object.\" '> 'n" "\" * \" '> 'n" "\" * @return a string representation of this object.\" '> 'n" "\" * \" '> 'n" "\" * @see java.lang.Object#toString\" '> 'n" "\" */\" '> 'n))" "(jdee-gen-method-signature \"public\" \"String\" \"toString\" \"\")" "(jdee-gen-electric-brace)" "(jdee-gen-tostring-return) '> 'n" "\"}\" '>") "\
*Template for creating an toString method.\nSetting this variable defines a template instantiation\ncommand `jdee-gen-tostring-method', as a side-effect.")

(custom-autoload 'jdee-gen-tostring-method-template "jdee-gen" nil)

(autoload 'jdee-gen-tostring-return "jdee-gen" "\
Generate a body of an appropriate override for the\njava.lang.Object#toString function. This gets the member variables\nof the current class from semantic via `semantic-current-tag'.\n\n(fn &optional CLASS)" t nil)

(autoload 'jdee-gen-object-methods "jdee-gen" "\
Generates an equals(), a hashCode() and a toString method.\n\n(fn)" t nil)

(defvar jdee-gen-exception-buffer-template (list "(open-line 1) (funcall jdee-gen-boilerplate-function)" "(jdee-gen-get-package-statement)" "(progn (require 'jdee-javadoc) (jdee-javadoc-insert-start-block))" "\" * Exception <code>\" (jdee-parse-get-buffer-unqualified-class) \"</code>.\" '> 'n" "\" \" (jdee-javadoc-insert-empty-line)" "\" * Created: \" (current-time-string) '> 'n" "\" \" (jdee-javadoc-insert-empty-line)" "\" \" (jdee-gen-save-excursion (jdee-javadoc-insert 'tempo-template-jdee-javadoc-author-tag))" "\" \" (jdee-gen-save-excursion (jdee-javadoc-insert 'tempo-template-jdee-javadoc-version-tag))" "\" \" (jdee-javadoc-insert-end-block)" "\"public class \"" "(jdee-parse-get-buffer-unqualified-class)" "\" \" (jdee-gen-get-extend-class)" "(jdee-gen-electric-brace)" "'p'n" "'> (jdee-javadoc-insert-start-block)" "\"* Constructs a new <code>\" (jdee-parse-get-buffer-unqualified-class) \"</code> with\" '>'n" "\"* <code>null</code> as its detail message.\" '>'n" "'> (jdee-javadoc-insert-end-block)" "(jdee-gen-method-signature \"public\" nil (jdee-parse-get-buffer-unqualified-class) nil)" "(jdee-gen-electric-brace)" "\"}\"'>'n" "'n" "'> (jdee-javadoc-insert-start-block)" "\"* Constructs a new <code>\" (jdee-parse-get-buffer-unqualified-class) \"</code> with\" '>'n" "\"* the specified detail message.\" '>'n" "'> (jdee-javadoc-insert-empty-line)" "\"* @param message the detail message string.\" '> 'n" "'> (jdee-javadoc-insert-end-block)" "(jdee-gen-method-signature \"public\" nil (jdee-parse-get-buffer-unqualified-class) \"String message\")" "(jdee-gen-electric-brace)" "\"super(message);\" '> 'n" "\"}\" '> 'n" "'n" "'> (jdee-javadoc-insert-start-block)" "\"* Constructs a new <code>\" (jdee-parse-get-buffer-unqualified-class) \"</code> with\" '>'n" "\"* the specified cause and a detail message of\" '> 'n" "\"* <code>(cause == null ? null : cause.toString())</code>\" '> 'n" "\"* (which typically contains the class and detail message of cause).\" '> 'n" "'> (jdee-javadoc-insert-empty-line)" "\"* @param cause the causing throwable. A null value is permitted\" '> 'n" "\"*     and indicates that the cause is nonexistent or unknown.\" '> 'n" "'> (jdee-javadoc-insert-end-block)" "(jdee-gen-method-signature \"public\" nil (jdee-parse-get-buffer-unqualified-class) \"Throwable cause\")" "(jdee-gen-electric-brace)" "\"super(cause == null ? (String) null : cause.toString());\" '> 'n" "\"initCause(cause);\" '> 'n" "\"}\" '> 'n" "'n" "'> (jdee-javadoc-insert-start-block)" "\"* Constructs a new <code>\" (jdee-parse-get-buffer-unqualified-class) \"</code> with\" '>'n" "\"* the specified cause and message.\" '> 'n" "'> (jdee-javadoc-insert-empty-line)" "\"* @param message the detail message string.\" '> 'n" "\"* @param cause the causing throwable. A null value is permitted\" '> 'n" "\"*     and indicates that the cause is nonexistent or unknown.\" '> 'n" "'> (jdee-javadoc-insert-end-block)" "(jdee-gen-method-signature \"public\" nil (jdee-parse-get-buffer-unqualified-class) \"String message,Throwable cause\")" "(jdee-gen-electric-brace)" "\"super(message);\" '> 'n" "\"initCause(cause);\" '> 'n" "\"}\" '> 'n" "\"}\" '>" "(if jdee-gen-comments (concat \" // \" (jdee-parse-get-buffer-unqualified-class)))" "'>'n") "\
*Template for a new exception class.\nSetting this variable defines a template instantiation\ncommand `jdee-gen-exception', as a side-effect.")

(custom-autoload 'jdee-gen-exception-buffer-template "jdee-gen" nil)

(autoload 'jdee-gen-exception-buffer "jdee-gen" "\
Create a new Java buffer containing an exception class of the same name.\nThis command inserts the template generated by `jdee-gen-exception'.\nIt then moves the point to the location of the first method.\n\n(fn FILE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-gen" '("jdee-" "tempo-initial-pos")))

;;;***

;;;### (autoloads nil "jdee-help" "jdee-help.el" (0 0 0 0))
;;; Generated autoloads from jdee-help.el

(autoload 'jdee-help-browse-jdk-doc "jdee-help" "\
Displays the JDK doc in a web browser.\n\n(fn)" t nil)

(autoload 'jdee-help-show-jdee-doc "jdee-help" "\
Opens the JDEE User's Guide info pages.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-help" '("jdee-" "initialize-instance" "object-print")))

;;;***

;;;### (autoloads nil "jdee-imenu" "jdee-imenu.el" (0 0 0 0))
;;; Generated autoloads from jdee-imenu.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-imenu" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-import" "jdee-import.el" (0 0 0 0))
;;; Generated autoloads from jdee-import.el

(autoload 'jdee-import-organize "jdee-import" "\
Organize import statements of the current Java source buffer.\nIf optional FORCE is non-nil force reordering even if imports are\nalready organized.\n\nImports are organized into groups returned by the function specified\nby `jdee-import-group-function'.  Groups are inserted in the order they\nare found unless `jdee-import-sorted-groups' requires that they must be\nalphabetically sorted.  In each group imports are sorted by name\nalphabetically or in reverse order if `jdee-import-reverse-sort-group'\nis non-nil.  A blank line is inserted between groups.\n\nUsage:\n  \\[jdee-import-organize] group and sort import statements.\n  \\[universal-argument] \\[jdee-import-organize] to force reordering.\n\nThe current buffer must be in `jdee-mode'.  This command requires a\nversion of the JDE with the semantic parser.\n\n(fn &optional FORCE)" t nil)

(autoload 'jdee-import-at-point "jdee-import" "\
Import a class at the current point.\nThe fully qualified class is received from user input.\n\n(fn CLASS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-import" '("jdee-import-" "efc-multi-option-dialog-sort" "initialize-instance")))

;;;***

;;;### (autoloads nil "jdee-issues" "jdee-issues.el" (0 0 0 0))
;;; Generated autoloads from jdee-issues.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-issues" '("jdee-problem-report-mail-address")))

;;;***

;;;### (autoloads nil "jdee-java-grammar" "jdee-java-grammar.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from jdee-java-grammar.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-java-grammar" '("jdee-parse-semantic-default-setup")))

;;;***

;;;### (autoloads nil "jdee-java-properties" "jdee-java-properties.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from jdee-java-properties.el

(autoload 'jdee-java-properties-mode "jdee-java-properties" "\
Major mode for Java properties files buffer.\n\n(fn)" t nil)

(autoload 'jdee-java-properties-validate "jdee-java-properties" "\
Determine whether or not the properties file conforms to the Sun\njava.util.Properties format.  Only the first invalid line is found.\n\nGOTO indicates whether or not to put the point at the first invalid line\nfound.\n\n(fn &optional GOTO)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-java-properties" '("jdee-java-properties-")))

;;;***

;;;### (autoloads nil "jdee-javadoc" "jdee-javadoc.el" (0 0 0 0))
;;; Generated autoloads from jdee-javadoc.el

(autoload 'jdee-javadoc-checker-previous "jdee-javadoc" "\
Go to the previous tag with doc errors.\n\n(fn)" t nil)

(autoload 'jdee-javadoc-checker-next "jdee-javadoc" "\
Goto the next tag with doc errors.\n\n(fn)" t nil)

(autoload 'jdee-javadoc-checker-fix "jdee-javadoc" "\
Fix documentation of checked tag.\nUsed in `jdee-javadoc-checker-report-mode'.\n\n(fn)" t nil)

(autoload 'jdee-javadoc-checker-quit "jdee-javadoc" "\
Quit the `jdee-javadoc-checker' report buffer.\nUsed in `jdee-javadoc-checker-report-mode'.\n\n(fn)" t nil)

(autoload 'jdee-javadoc-customize "jdee-javadoc" "\
Show the jdee-javadoc options panel.\n\n(fn)" t nil)

(autoload 'jdee-javadoc-autodoc-at-line "jdee-javadoc" "\
Update javadoc comment block for declaration at current line.\n\nUses the semantic bovinator parser table to find declarations (see\n`jdee-javadoc-nonterminal-at-line').\n\nBEFORE EXECUTING THE COMMAND, THE POINT MUST BE LOCATED AT THE FIRST\nLINE OF THE CLASS OR METHOD DECLARATION.  IF NOT RESULT IS UNCERTAIN.\n\nIn the following examples, point is located at the beginning of the\nline, before the word 'public' (but it could be anywhere on this\nline):\n\n1- Class example:\n   -------------\n\n-|-  public class MyClass\n       extends MySuperClass implements Runnable, java.io.Serializable\n     {\n       ...\n\n\\[jdee-javadoc-autodoc-at-line] inserts:\n\n+    /**\n+     * Describe class <code>MyClass</code> here.\n+     *\n+     * @author \"David Ponce\" <david.ponce@wanadoo.fr>\n+     * @version 1.0\n+     * @since 1.0\n+     * @see MySuperClass\n+     * @see Runnable\n+     * @see java.io.Serializable\n+     */\n     public class MyClass\n       extends MySuperClass implements Runnable, java.io.Serializable\n     {\n       ...\n\n2- Method example:\n   --------------\n\n-|-  public\n     void   myMethod( int  x,  int y )\n       throws Exception\n     {\n       ...\n\n\\[jdee-javadoc-autodoc-at-line] inserts:\n\n+    /**\n+     * Describe <code>myMethod</code> method here.\n+     *\n+     * @param x an <code>int</code> value\n+     * @param y a <code>long</code> value\n+     * @exception Exception if an error occurs\n+     */\n     public\n     void   myMethod( int  x,  long y )\n       throws Exception\n     {\n       ...\n\n3- Field example:\n   --------------\n\n-|-  private static final int SIZE = 10;\n\n\\[jdee-javadoc-autodoc-at-line] inserts:\n\n+    /**\n+     * Describe constant <code>SIZE</code> here.\n+     */\n     private static final int SIZE = 10;\n\n\n`tempo' templates are used for each category of javadoc line.  The\nfollowing templates are currently defined and fully customizable (see\n`tempo-define-template' for the different items that can be used in a\ntempo template):\n\n- - `jdee-javadoc-author-tag-template'\n- - `jdee-javadoc-describe-class-template'\n- - `jdee-javadoc-describe-constructor-template'\n- - `jdee-javadoc-describe-interface-template'\n- - `jdee-javadoc-describe-method-template'\n- - `jdee-javadoc-describe-field-template'\n- - `jdee-javadoc-exception-tag-template'\n- - `jdee-javadoc-param-tag-template'\n- - `jdee-javadoc-return-tag-template'\n- - `jdee-javadoc-version-tag-template'\n\nFor example if you customize `jdee-javadoc-describe-class-template'\nwith the following value:\n\n'(\"* \" (P \"Class description: \"))\n\nyou will be asked to enter the class description in the minibuffer.\nSee also the `jdee-javadoc-field-type', `jdee-javadoc-a' and\n`jdee-javadoc-code' helper functions.\n\n(fn)" t nil)

(autoload 'jdee-javadoc-remdoc-at-line "jdee-javadoc" "\
Remove javadoc comment block for declaration at current line.\nRequire confirmation if optional NOCONFIRM is non-nil.\nReturn non-nil if done.\nThis uses `jdee-javadoc-nonterminal-at-line' to find declarations.\n\n(fn &optional NOCONFIRM)" t nil)

(autoload 'jdee-javadoc-checkdoc-at-line "jdee-javadoc" "\
Check javadoc comment block of declaration at current line.\n\nUses the semantic bovinator parser table to find declarations (see\n`jdee-javadoc-nonterminal-at-line').\n\nBEFORE EXECUTING THE COMMAND, THE POINT MUST BE LOCATED AT THE FIRST\nLINE OF THE CLASS OR METHOD DECLARATION.  IF NOT RESULT IS UNCERTAIN.\n\n(fn)" t nil)

(autoload 'jdee-javadoc-checkdoc "jdee-javadoc" "\
Check doc comments of tags in the current buffer.\nReport the next tag with documentation errors.\n\n(fn)" t nil)

(autoload 'jdee-javadoc-remove "jdee-javadoc" "\
Remove all Javadoc from the region (if one is active) or the buffer.\nSTART, the start position in the buffer.\nEND, the end position in the buffer.\n\n(fn START END)" t nil)

(autoload 'jdee-javadoc-enable-menu-p "jdee-javadoc" "\
Return non-nil if corresponding doc menu item is enabled.\nThat is point is on the first line of a class, method, or field\ndefinition.\n\n(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-javadoc" '("jdee-javadoc-")))

;;;***

;;;### (autoloads nil "jdee-javadoc-gen" "jdee-javadoc-gen.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from jdee-javadoc-gen.el

(autoload 'jdee-javadoc-make-internal "jdee-javadoc-gen" "\
Generates javadoc for the current project if MAKE-PACKAGES-P\nand `jdee-javadoc-gen-packages' are nonnil; otherwise, make doc\nfor the current buffer. This command runs the\ncurrently selected javadoc's program to generate the documentation.\nIt uses `jdee-get-jdk-dir' to determine the location of\nthe currentlyh selected JDK. The variable `jdee-global-classpath' specifies\nthe javadoc -classpath argument. The variable `jdee-sourcepath'\nspecifies the javadoc  -sourcepath argument. You can specify all\nother javadoc options via JDE customization variables. To specify the\noptions, select Project->Options->Javadoc from the JDE menu. Use\n`jdee-javadoc-gen-packages' to specify the packages, classes, or source\nfiles for which you want to generate javadoc. If this variable is nil,\nthis command generates javadoc for the Java source file in the current\nbuffer. If `jdee-javadoc-display-doc' is nonnil, this command displays\nthe generated documentation in a browser.\n\n(fn &optional MAKE-PACKAGES-P)" nil nil)

(autoload 'jdee-javadoc-make "jdee-javadoc-gen" "\
Generates javadoc for the current project. This command runs the\ncurrently selected JDK's javadoc program to generate the documentation.\nIt uses `jdee-get-jdk-dir' to determine the location of the currently\nselected JDK. The variable `jdee-global-classpath' specifies the javadoc\n-classpath argument. The variable `jdee-sourcepath'\nspecifies the javadoc  -sourcepath argument. You can specify all\nother javadoc options via JDE customization variables. To specify the\noptions, select Project->Options->Javadoc from the JDE menu. Use\n`jdee-javadoc-gen-packages' to specify the packages, classes, or source\nfiles for which you want to generate javadoc. If this variable is nil,\nthis command generates javadoc for the Java source file in the current\nbuffer. If `jdee-javadoc-display-doc' is nonnil, this command displays\nthe generated documentation in a browser.\n\n(fn)" t nil)

(autoload 'jdee-javadoc-make-buffer "jdee-javadoc-gen" "\
Generates javadoc for the current buffer. This command runs the\ncurrently selected JDK's javadoc program to generate the\ndocumentation. It uses `jdee-get-jdk-dir' to determine the location of the currently\nselected JDK.  The variable `jdee-global-classpath' specifies the\njavadoc -classpath argument. The variable `jdee-sourcepath' specifies\nthe javadoc -sourcepath argument. You can specify all other javadoc\noptions via JDE customization variables. To specify the options,\nselect Project->Options->Javadoc from the JDE menu. Use\n`jdee-javadoc-make' to generate doc for the files and packages\nspecified by `jdee-javadoc-gen-packages'. If `jdee-javadoc-display-doc'\nis nonnil, this command displays the generated documentation in a\nbrowser.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-javadoc-gen" '("jdee-javadoc-" "get-args" "initialize-instance")))

;;;***

;;;### (autoloads nil "jdee-jdb" "jdee-jdb.el" (0 0 0 0))
;;; Generated autoloads from jdee-jdb.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-jdb" '("jdee-" "initialize-instance")))

;;;***

;;;### (autoloads nil "jdee-jdk-manager" "jdee-jdk-manager.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from jdee-jdk-manager.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-jdk-manager" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-juci" "jdee-juci.el" (0 0 0 0))
;;; Generated autoloads from jdee-juci.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-juci" '("jdee-juci-")))

;;;***

;;;### (autoloads nil "jdee-junit" "jdee-junit.el" (0 0 0 0))
;;; Generated autoloads from jdee-junit.el

(autoload 'jdee-junit-test-class "jdee-junit" "\
Instantiate a test class template.\n\n(fn)" t nil)

(autoload 'jdee-junit4-test-class "jdee-junit" "\
Instantiate a test class template.\n\n(fn)" t nil)

(autoload 'jdee-junit-test-class-buffer "jdee-junit" "\
Create a buffer containing a skeleton unit test class.\nThe buffer name will have the same name as the root name of the buffer.\nThis command prompts you to enter the file name of the test class.  It assumes\nthat the file name has the form CLASSTest.java where CLASS is the name of the\nclass to be tested, e.g., MyAppTest.java.\nUse `jdee-gen-junit-add-test-to-suite' to add tests to the test suite.  Use of\ntests generated with this template requires the JUnit test framework.\n\n(fn)" t nil)

(autoload 'jdee-junit4-test-class-buffer "jdee-junit" "\
Create a buffer containing a JUnit4 test skeleton.\n\n(fn)" t nil)

(autoload 'jdee-junit-add-test-to-suite "jdee-junit" "\
Instantiate an addTest method.\n\n(fn)" t nil)

(autoload 'jdee-junit-run "jdee-junit" "\
Start JUnit testrunner with buffer corresponding class name.\n\n(fn)" t nil)

(autoload 'jdee-junit-show-options "jdee-junit" "\
Show the JDEE JUnit Options panel.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-junit" '("jdee-junit")))

;;;***

;;;### (autoloads nil "jdee-keys" "jdee-keys.el" (0 0 0 0))
;;; Generated autoloads from jdee-keys.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-keys" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-log" "jdee-log.el" (0 0 0 0))
;;; Generated autoloads from jdee-log.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-log" '("jdee-log-")))

;;;***

;;;### (autoloads nil "jdee-make" "jdee-make.el" (0 0 0 0))
;;; Generated autoloads from jdee-make.el

(autoload 'jdee-make "jdee-make" "\
Run the make program specified by `jdee-make-program' with the\ncommand-line arguments specified by `jdee-make-args'. If\n`jdee-read-make-args' is nonnil, this command also prompts you to enter\nmake arguments in the minibuffer and passes any arguments that you\nenter to the make program along with the arguments specified by\n`jdee-make-args'.\n\n(fn)" t nil)

(autoload 'jdee-make-show-options "jdee-make" "\
Show the JDEE Make Options panel.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-make" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-maven" "jdee-maven.el" (0 0 0 0))
;;; Generated autoloads from jdee-maven.el

(autoload 'jdee-maven-build "jdee-maven" "\
Build using the maven command from PATH (default to `default-directory')\n\n(fn &optional PATH)" t nil)

(autoload 'jdee-maven-hook "jdee-maven" "\
Initialize the maven integration if available.  Runs all the\nfunctions in `jdee-maven-init-hook' until one returns non-nil.\nIf all return nil, maven mode is not initialized.  If one of the\nfunctions returns non-nil, set `jdee-maven-project-dir' buffer\nlocal and then run the functions in `jdee-maven-mode-hook'.\n\n(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-maven" '("jdee-maven-")))

;;;***

;;;### (autoloads nil "jdee-open-source" "jdee-open-source.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from jdee-open-source.el

(autoload 'jdee-read-class "jdee-open-source" "\
Select a class interactively.  PROMPT is used to prompt the user for the\nfirst class name, FQ-PROMPT is used only if the class name expands into more\nthan one fully qualified name.\n\nPROMPT text used to prompt the user for the simple class name, or\n\"Class\" as the default.  Don't add the colon/space at the end\nof this prompt as a default will be added if it exists.\n\nFQ-PROMPT text used to prompt the fully qualified class name, or\n\"Select qualified class\" as the default.  Don't add the\ncolon/space at the end of this prompt as a default will be added\nif it exists.\n\nTHIS-CLASS-P, if non-nil, use the current class name if no class name at point\nand we are in a JDEE buffer.\n\nCONFIRM-FQ-P, if non-nil, confirm the class name even when there\nis only one unique fully qualified class found for the simple\nclass name (that is the class without the package part in the\nname).\n\nNO-CONFIRM-NFQ-P, if non-nil, don't confirm the class to check for fully\nqualified classes if it is obtainable from either the point or this class (see\nTHIS-CLASS-P).  If obtained from the point, then the class name is parsed with\n`jdee-parse-class-name' for the input.\n\nVALIDATE-FN is a function to validate the class.  This function takes an\nargument the output from `jdee-parse-class-name' given from the first user input\nclass name query.  The function should raise an error if there is anything\nwrong with the class.  If this is `nil', then no validate is done.\n\nWhen called interactively, select the class and copy it to the kill ring.\n\n(fn &optional PROMPT FQ-PROMPT THIS-CLASS-P CONFIRM-FQ-P NO-CONFIRM-NFQ-P VALIDATE-FN)" t nil)

(autoload 'jdee-find-class-source "jdee-open-source" "\
*Find the source file for a specified fully qualified class.\nCalls `jdee-find-class-source-file' to do the search.\nIf it finds the source file, it opens the file in a buffer.\n\n(fn CLASS &optional OTHER-WINDOW)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-open-source" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-package" "jdee-package.el" (0 0 0 0))
;;; Generated autoloads from jdee-package.el

(autoload 'jdee-package-update "jdee-package" "\
Create or update the package statement in the current Java source\nfile buffer based on the file's location relative to the root of\nthe package directory as specified by one of the entries in\n`jdee-package-search-classpath-variables' or `jdee-sourcepath'.\nIf these variables do not specify the root of the package directory,\nthis command does nothing. This command signals an error if the\n major mode of the current buffer is not `jdee-mode'.\n\nThe buffer is not modified if the package statement that would be\ninserted exactly matches the existing package statement.  This\nmeans that this can be called from `jdee-mode-hook` without\nspuriously marking the buffer as modified.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-package" '("jdee-package-")))

;;;***

;;;### (autoloads nil "jdee-parse" "jdee-parse.el" (0 0 0 0))
;;; Generated autoloads from jdee-parse.el

(autoload 'jdee-parse-get-buffer-class "jdee-parse" "\
Get the fully qualified name of the class of this buffer.\n\nNO-PACKAGE-P, if non-`nil', return only the class name (sans\npackage name), otherwise, include the package name.\n\nIf called interactively, add the name in the mini-buffer.\n\n(fn &optional NO-PACKAGE-P)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-parse" '("jdee-" "initialize-instance")))

;;;***

;;;### (autoloads nil "jdee-parse-expr" "jdee-parse-expr.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from jdee-parse-expr.el

(autoload 'jdee-hungarian-to-reverse-camel-notation "jdee-parse-expr" "\
Converts Hungarian (i.e. m_sMyApp) to reverse camel notation (i.e. myApp).\nHungarian notation is used, for example, in most Microsoft visual C++ code\nwhereas reverse camel notation is used as the Sun Java standard style.\n\nSTART the start of the buffer region\nEND is the end of the buffer region\nLOCAL-REPLACEMENT-P, if non-nil, replace expecting a local variable\nreplacement.  This adds a `this.' to each replacment.\n\n(fn START END LOCAL-REPLACEMENT-P)" t nil)

(autoload 'jdee-camel-to-sql "jdee-parse-expr" "\
Convert from reverse camel notation to the SQL underscore convention.\n\n(fn START END)" t nil)

(autoload 'jdee-camel-to-c-const "jdee-parse-expr" "\
Convert from reverse camel notation to the C constant convention.\n\n(fn START END)" t nil)

(autoload 'jdee-camel-to-lisp "jdee-parse-expr" "\
Convert from reverse camel notation to the lisp symbol convention.\n\n(fn START END)" t nil)

(autoload 'jdee-member-to-attribute "jdee-parse-expr" "\
Convert Java member to a getter or setter syntax.\n\nMEMBER-NAME is member to convret.  This is taken as the current word at point\nwhen called interactively.\n\nGETTERP, if non-nil, make it a getter, otherwise make it a setter.  If\n\\[universal-argument] is used while calling interactively, then make it a\nsetter, otherwise, make a getter.\n\n(fn MEMBER-NAME GETTERP)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-parse-expr" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-plugins" "jdee-plugins.el" (0 0 0 0))
;;; Generated autoloads from jdee-plugins.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-plugins" '("jdee-p")))

;;;***

;;;### (autoloads nil "jdee-project" "jdee-project.el" (0 0 0 0))
;;; Generated autoloads from jdee-project.el

(autoload 'jdee-project-create-project "jdee-project" "\
Create a JDEE project.\n\n(fn)" t nil)

(autoload 'jdee-describe-path "jdee-project" "\
Print and give file existance for each path.\nPATH-TYPE is either `global classpath' for `jdee-global-classpath' or\n`source path' for `jdee-sourcepath'.\n\n(fn PATH-TYPE &optional BUF)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-project" '("jdee-project" "efc-dialog-")))

;;;***

;;;### (autoloads nil "jdee-project-file" "jdee-project-file.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from jdee-project-file.el

(autoload 'jdee-open-project-file "jdee-project-file" "\
Open the project file for the Java source file in the current buffer.\n\n(fn)" t nil)

(autoload 'jdee-save-project "jdee-project-file" "\
Save source file buffer options in one or more project files.\nThis command provides an easy way to create and update a project file\nfor a Java project.  Simply open a source file, set the desired\noptions, using the JDEE Options menu, then save the settings in the\nproject file, using this command.  Now, whenever you open a source\nfile from the same directory tree, the saved settings will be restored\nfor that file.\n\n(fn)" t nil)

(autoload 'jdee-create-new-project "jdee-project-file" "\
Create a new JDEE project file in directory NEW-DIR, saving any\ncurrent customized variables.  If a project file already exists in the\ngiven directory, the project is simply re-saved.  This functions the\nsame as `jdee-save-project' when no project files can be found for the\ncurrent source file.  But, if there already exist projects somewhere\nalong the path, this command unconditionally creates a project file in\nthe directory specified, thus allowing the user to create and maintain\nhierarchical projects.\n\n(fn NEW-DIR)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-project-file" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-refactor" "jdee-refactor.el" (0 0 0 0))
;;; Generated autoloads from jdee-refactor.el

(autoload 'jdee-rename-class "jdee-refactor" "\
Rename the current class to another class name.  This does a class name\nstring replace, changes the buffer name, and changes the file name.\n\n(fn NEW-CLASS-NAME)" t nil)

(autoload 'jdee-replace-fully-qualified-class-at-point "jdee-refactor" "\
Replace the unqualified class at the current point with the fully qualified\nclass.\n\n(fn CLASS)" t nil)

;;;***

;;;### (autoloads nil "jdee-run" "jdee-run.el" (0 0 0 0))
;;; Generated autoloads from jdee-run.el

(autoload 'jdee-run-set-app "jdee-run" "\
Specify the name of the application class to run.\n\n(fn APP)" t nil)

(autoload 'jdee-run-set-args "jdee-run" "\
Specify arguments to be passed to the Java vm.\nThis command serves as an alternative to using the JDE Run Options\npanel to specify command-line arguments for the Java interpreter.\n\n(fn ARGS)" t nil)

(autoload 'jdee-run-set-app-args "jdee-run" "\
Specify the arguments to be passed to the Java application class.\nThis command provides an alternative to using the JDE Run Options panel\nto specify command-line arguments to pass to the application when starting\nthe application.\n\n(fn ARGS)" t nil)

(autoload 'jdee-run-set-applet-viewer "jdee-run" "\
Sets the viewer to be used to view an applet. The default is\nappletviewer.\n\n(fn VIEWER)" t nil)

(autoload 'jdee-run-set-applet-doc "jdee-run" "\
Specify the doc to be used to view an applet.\nThis command provides an alternative to using the JDE Options\npanel to specifying the applet document.\n\n(fn DOC)" t nil)

(autoload 'jdee-run "jdee-run" "\
Run the Java application specified by `jdee-run-executable', if\nnot the null string. Otherwise run the class specified by\n`jdee-run-application-class', if non-null; otherwise the class in the\ncurrent buffer. Specifying a prefix argument, e.g., C-u C-c C-v C-r,\ncauses this command to prompt you to enter arguments to be passed to\nthe application's main method.  Specifying a minus prefix argument,\ni.e., C-u - C-c C-v C-r, causes this command to prompt you to also\nenter the name of the application's main class.  Note that you can use\n`jdee-run-read-app-args' to cause the command to prompt you for\napplication arguments by default (i.e., without having to specify a\nprefix argument). This command creates a comint buffer to allow you to\ninteract with the program.\n\n(fn PREFIX)" t nil)

(autoload 'jdee-run-applet "jdee-run" "\
Runs an applet. This function prompts you to enter the path of an\nhtml document that displays the applet. If you enter return without\nspecifying a document, this function next checks whether\n`jdee-run-applet-doc' specifies a document. If so, it displays that\nspecified document. Next, it checks whether the current directory\ncontains any html files. If the current directory contains an html\nfile with the same root name as the Java file in the current buffer,\nit displays the file. If not, it displays the first html file that it\nfinds in the current directory. If if cannot find an html file, it\nsignals an error.  This function uses the viewer specified by\n`jdee-run-applet-viewer' to display the specified document. Note that\nif you run two html applet files successively with the same name, you\nmust kill the buffer created to run the first file before running the\nsecond file. Otherwise, this command will simply redisplay the first\nfile.\n\n(fn &optional DOC)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-run" '("jdee-" "initialize-instance" "save-w32-show-window")))

;;;***

;;;### (autoloads nil "jdee-stacktrace" "jdee-stacktrace.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from jdee-stacktrace.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-stacktrace" '("jdee-stacktrace-")))

;;;***

;;;### (autoloads nil "jdee-stat" "jdee-stat.el" (0 0 0 0))
;;; Generated autoloads from jdee-stat.el

(autoload 'jdee-stat-loc-report "jdee-stat" "\
Generates a report showing the number of code, comment,\njavadoc, and blank lines in the current Java source buffer. Optionally\na total count could be passed to be displayed, as well as the number of\nprocessed files.\n\n(fn &optional COUNT &optional TOTAL-FILES)" t nil)

(autoload 'jdee-stat-loc-report-project "jdee-stat" "\
Generates a report showing the number of code, comment,\njavadoc, and blank lines in all the java files in the current\ndirectory and subdirectories. This method will kill any\nbuffer containing a java file contained in dir.\n\n(fn DIR)" t nil)

(autoload 'jdee-stat-loc-report-directory "jdee-stat" "\
Generates a report showing the number of code, comment,\njavadoc, and blank lines in all the java files in the current\ndirectory. This method will kill any buffer containing a java file\ncontained in dir.\n\n(fn DIR)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-stat" '("jdee-stat-")))

;;;***

;;;### (autoloads nil "jdee-test" "jdee-test.el" (0 0 0 0))
;;; Generated autoloads from jdee-test.el

(autoload 'jdee-test-unittest "jdee-test" "\
Perform unit test.  Delegates to the function specified by `jdee-test-function'.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-test" '("jdee-test-function")))

;;;***

;;;### (autoloads nil "jdee-util" "jdee-util.el" (0 0 0 0))
;;; Generated autoloads from jdee-util.el

(autoload 'jdee-require "jdee-util" "\
Require FEATURE, either pre-installed or from the distribution.\nThat is, first try to load the FEATURE library.  Then try to load the\njdee-FEATURE library from the JDEE's distribution.\nSignal an error if FEATURE can't be found.\n\n(fn FEATURE)" nil nil)

(autoload 'jdee-exception-goto "jdee-util" "\
Go to the Java source file and line indicated by an exception stack trace.\n\n(fn)" t nil)

(defalias 'jdee-goto-exception 'jdee-exception-goto)

(autoload 'jdee-htmlize-code "jdee-util" "\
Write the current code region as an HTML document.\nLine numbers are added as well.\n\nRequires ELPA package `htmlize'.\n\nSee `jdee-htmlize-code-destinations'.\n\n(fn START END &optional NO-LINE-NUMBERS-P)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-util" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-which-method" "jdee-which-method.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from jdee-which-method.el

(defvar jdee-which-method-mode t "\
Enables the JDEE's which method mode.\nWhen which method mode is enabled, the current method name is\ndisplayed in the mode line.")

(custom-autoload 'jdee-which-method-mode "jdee-which-method" t)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-which-method" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-widgets" "jdee-widgets.el" (0 0 0 0))
;;; Generated autoloads from jdee-widgets.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-widgets" '("test-" "jdee-")))

;;;***

;;;### (autoloads nil "jdee-wiz" "jdee-wiz.el" (0 0 0 0))
;;; Generated autoloads from jdee-wiz.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-wiz" '("jdee-")))

;;;***

;;;### (autoloads nil "jdee-xref" "jdee-xref.el" (0 0 0 0))
;;; Generated autoloads from jdee-xref.el

(autoload 'jdee-xref-make-xref-db "jdee-xref" "\
Create a database of caller to callee (and the reverse) from the\nclasses in `jdee-built-class-path' and store the data in the location\nspecified by `jdee-xref-db-base-directory'\n\n(fn)" t nil)

(autoload 'jdee-xref-first-caller "jdee-xref" "\
Put the list of who calls the current function on the stack and\ndisplay the first caller.  Subsequent callers are displayed through\n`jdee-xref-show-next-caller'.  STRICT should be true if the callers of\ninterfaces to a function, or calls to a superclass which may result in\na virtual function call to the subclass should not be considered.  In\nother words, if STRICT is true, then only calls that are definitely to\nthe requested function are considered.\n\n(fn STRICT)" t nil)

(autoload 'jdee-xref-next-caller "jdee-xref" "\
If there are items still on the caller stack, pop the first one off\nand show it\n\n(fn)" t nil)

(autoload 'jdee-xref-display-call-tree "jdee-xref" "\
Display an interactive call tree of which function call the current\n  function, which can be expanded outward.  STRICT should be true if\n  the callers of interfaces to a function, or calls to a superclass\n  which may result in a virtual function call to the subclass should\n  not be considered.  In other words, if STRICT is true, then only\n  calls that are definitely to the requested function are considered. \n\n(fn STRICT)" t nil)

(autoload 'jdee-xref-list-uncalled-functions "jdee-xref" "\
Displays a simple list of function that are never called, at least\nnot directly.  Do not assume that this means this code can never be\nreached, since reflection could always call any method.  Use this list\nand your best judgement to figure out what are good candidates for\ncode cleanup.  STRICT should be true if the callers of interfaces to a\nfunction, or calls to a superclass which may result in a virtual\nfunction call to the subclass should not be considered.  In other\nwords, if STRICT is true, then only calls that are definitely to the\nrequested function are considered.  This function could take a\nwhile. If it does, you might want to consider increasing\n`jdee-xref-cache-size'.\n\n(fn STRICT)" t nil)

(autoload 'jdee-xref-update "jdee-xref" "\
Update the caller table after a recompile.  This can be called by\nthe user when they recompile outside of emacs.  It will update the\ncall list of all files modified in emacs\n\n(fn &rest IGNORED)" t nil)

(autoload 'jdee-xref-customize "jdee-xref" "\
Display the customization buffer for the xref package.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jdee-xref" '("jdee-xref-")))

;;;***

;;;### (autoloads nil nil ("jdee-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; jdee-autoloads.el ends here
