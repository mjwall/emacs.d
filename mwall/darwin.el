;; fullscreen toggle.  This method is available because I patched the GNU emacs build
;; using this post http://www.sanityinc.com/full-screen-support-for-cocoa-emacs-on-osx
(when (fboundp 'ns-toggle-fullscreen)
  (global-set-key (kbd "M-RET") 'ns-toggle-fullscreen))

;; add homebrew's /usr/local/bin to exec-path, pick up git et. al.
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))

;; from http://stackoverflow.com/questions/1850292/emacs-23-1-and-mac-os-x-problem-with-files-drag-and-drop
(define-key global-map [ns-drag-file] 'my-ns-open-files)
(setq ns-pop-up-frames nil) ; make emacs open in existing frames
(defun my-ns-open-files ()
  "Open files in the list `ns-input-file'."
  (interactive)
  (mapc 'find-file ns-input-file)
  (setq ns-input-file nil))

;; fonts
;(setq mac-allow-anti-aliasing nil)
(set-default-font "Monaco-13")
;;    (set-default-font "Inconsolata-14"))
