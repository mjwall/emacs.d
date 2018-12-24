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
# emacs on MacOSX, seems to be needed by cask
export EMACSHOME=/Applications/Emacs.app/Contents/MacOS
prepend_path "${EMACSHOME}/bin"
prepend_path "${HOME}/.emacs.d/bin"
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
