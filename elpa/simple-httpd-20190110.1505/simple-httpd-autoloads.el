;;; simple-httpd-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "simple-httpd" "simple-httpd.el" (0 0 0 0))
;;; Generated autoloads from simple-httpd.el

(autoload 'httpd-start "simple-httpd" "\
Start the web server process. If the server is already\nrunning, this will restart the server. There is only one server\ninstance per Emacs instance.\n\n(fn)" t nil)

(autoload 'httpd-stop "simple-httpd" "\
Stop the web server if it is currently running, otherwise do nothing.\n\n(fn)" t nil)

(autoload 'httpd-running-p "simple-httpd" "\
Return non-nil if the simple-httpd server is running.\n\n(fn)" nil nil)

(autoload 'httpd-serve-directory "simple-httpd" "\
Start the web server with given `directory' as `httpd-root'.\n\n(fn DIRECTORY)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "simple-httpd" '("httpd" "defservlet" "with-httpd-buffer")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; simple-httpd-autoloads.el ends here
