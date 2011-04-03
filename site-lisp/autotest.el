;;; autotest.el

;; Copied from autotest.el by Ryan Davis
;; http://www.emacswiki.org/emacs/autotest.el

;;;
;;; The MIT License:

;; http://en.wikipedia.org/wiki/MIT_License
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:

;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
;; IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
;; CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
;; TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
;; SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;;; Commentary:

;; Started with Ryan's autotest and tweaked it for my setup.
;; Uses Phil Jackson project-root from http://repo.or.cz/w/ShellArchive.git?a=blob_plain;hb=HEAD;f=project-root.el

;; This setup is tested on Emacs 23.3 with rpsec 2.5 and rails
;; I normally use multi-term, so using shell for this doesn't affect my workflow

(require 'shell)
(require 'project-root)

(defcustom autotest-command "autotest"
   "Command name to use to execute autotest."
   :group 'autotest
   :type '(string))

;;;###autoload
(defun autotest ()
  "Fire up an instance of autotest in its own buffer with shell bindings and compile-mode highlighting and linking."
  (interactive)
  (with-project-root
      (shell "*autotest*")
      (define-key shell-mode-map "\C-c\C-a" 'autotest-switch)

      (set (make-local-variable 'comint-buffer-maximum-size) 5000)
      (set (make-local-variable 'comint-scroll-show-maximum-output) t)
      (set (make-local-variable 'comint-scroll-to-bottom-on-output) t)
      (set (make-local-variable 'compilation-error-regexp-alist)
           '(
             (" [#] \\(\\..*\\.rb\\)[:]\\([0-9]+\\)" 1 2)
             ))
      (compilation-shell-minor-mode)

      (comint-send-string "*autotest*" (concat autotest-command "\n")))
)

(defun autotest-switch ()
  "Switch back and forth between autotest and the previous buffer"
  (interactive)
  (if (equal "*autotest*" (buffer-name))
      (switch-to-buffer (other-buffer))
    (switch-to-buffer "*autotest*")))

(global-set-key (kbd "C-c C-a") 'autotest-switch)

(provide 'autotest)
