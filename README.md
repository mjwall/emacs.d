# My emacs config

Here is my latest incantation of an emacs config.  This time, I am going for a more minimal config, but trying to keep the more full featured config just in case I need it.  To do this, I am using some alias in my bashrc

## Alias

So normal emacs will be in the terminal and will not load packages (although there a few things I put in site-lisp that will get loaded).  The `pemacs` command will load the basic config and then load packages for a more full featured experience, but still in terminal.  The `gemacs` command will launch the same emacs as `pemacs` but will launch the gui version.  These assume EMACS_HOME is set.

```
alias emacs="${EMACS_HOME}/bin/emacs -nw"
alias pemacs="${EMACS_HOME}/bin/emacs -Q -nw -l ${HOME}/emacs.d/init-elpa.el"
alias gemacs="${EMACS_HOME}/bin/emacs -Q -l ${HOME}/emacs.d/init-elpa.el"
```

## Git editor

```
export GIT_EDITOR='${EMACS_HOME}/bin/emacs -Q -nw -l ${HOME}/emacs.d/init-git-editor.el'
```

## Script

Talk about bin directory, which I don't really use anymore

## Profiling

Look at https://www.emacswiki.org/emacs/ProfileDotEmacs

Downloaded file http://www.randomsample.de/profile-dotemacs.el to
~/.emacs.d/src/profile-dotemacs.el

Edit file and change defvar profile-dotemacs-file from ~/.emacs to
~/.emacs.d/init.el

Then run

```
emacs -Q -l src/profile-dotemacs.el -f profile-dotemacs
```

Look for file for overlays of slow expressions
