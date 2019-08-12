# My emacs config

Here is my latest incantation of an emacs config.  This time, I am going for a more minimal config, but trying to keep the more full featured config just in case I need it.  To do this, I am using some alias in my bashrc

## Alias

So my normal emacs will the terminal version.  I will use `gemacs` to launch the gui version of my minimal config and `femacs` to launch the previous config, which is stored in ~/.emacs.d/full.  These assume EMACS_HOME is set.

```
alias emacs="${EMACS_HOME}/bin/emacs -nw"
alias gemacs="${EMACS_HOME}/bin/emacs"
```

## Git editor

```
export GIT_EDITOR='${EMACS_HOME}/bin/emacs -nw'
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
