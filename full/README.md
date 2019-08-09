# ~/.emacs.d

My emacs config

## Linux



## Mac

Compiling

Either

```
./src/get-src.sh
```
or

```
git clone git@bitbucket.org:mituharu/emacs-mac.git
```

Then build it

```
git co emacs-26.1-mac-7.4
./autogen.sh
./configure --enable-mac-app=/Applications --without-pop --with-mailutils --prefix=/Applications/Emacs.app/Contents/MacOS
PATH="/usr/local/opt/texinfo/bin:$PATH" make
make install
```

Add to ~/.bashrc
```
# editors
export EMACSHOME=/WHATEVERPATH
prepend_path "${EMACSHOME}/bin"
prepend_path "${HOME}/.emacs.d/bin"
# setup alias so calling emacs from command line stays in terminal and skips org-sync
# can still run emacs windows mode by opening the app
alias emacs="emacs -Q -nw --eval '(defvar no-org-sync t)' --load ~/.emacs.d/init.el"
# now setup GIT_EDITOR
export GIT_EDITOR='emacs -nw -Q -l ${HOME}/.emacs.d/init-git-editor.el'
```


## Profiling

Look at https://www.emacswiki.org/emacs/ProfileDotEmacs

Download file http://www.randomsample.de/profile-dotemacs.el to
~/.emacs.d/src/profile-dotemacs.el

Edit file and change defvar profile-dotemacs-file from ~/.emacs to
~/.emacs.d/init.el

Then run

```
emacs -Q -l src/profile-dotemacs.el -f profile-dotemacs
```

Look for file for overlays of slow expressions
