# My emacs config

Here is my latest incantation of an emacs config.  This time, I am going for a more minimal config, but trying to keep the more full featured config just in case I need it.  To do this, I am using some alias in my bashrc

## Alias

So my normal emacs will the terminal version.  I will use `gemacs` to launch the gui version of my minimal config and `femacs` to launch the previous config, which is stored in ~/.emacs.d/full.  These assume EMACS_HOME is set.

```
alias emacs="${EMACS_HOME}/bin/emacs -nw"
alias gemacs="${EMACS_HOME}/bin/emacs"
alias femacs="${EMACS_HOME}/bin/emacs -Q --eval '(setq user-emacs-directory "~/.emacs.d/full")' --load ~/.emacs.d/full/init.el"
```

## Git editor

```
export GIT_EDITOR='${EMACS_HOME}/bin/emacs -nw'
```