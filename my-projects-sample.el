;; copy to my-projects.el and customize
(project-def "my-java-project"
      '((basedir          "/home/me/my-java-project/")
        (src-patterns     ("*.java" "*.jsp"))
        (ignore-patterns  ("*.class" "*.wsdl"))
        (tags-file        "/home/me/.my-java-project/TAGS")
        (file-list-cache  "/home/me/.my-java-project/files")
        (open-files-cache "/home/me/.my-java-project/open-files")
        (vcs              git)
        (compile-cmd      "ant")
        (ack-args         "--java")
        (startup-hook     my-java-project-startup)
        (shutdown-hook    nil)))

(defun my-java-project-startup ()
  (setq c-basic-offset 3))
