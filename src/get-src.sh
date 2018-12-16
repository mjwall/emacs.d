#!/bin/bash

# git clone emacs source

SRC_DIR=${HOME}/.emacs.d/src

test -d ${SRC_DIR}/emacs || git clone git@github.com:emacs-mirror/emacs.git ${SRC_DIR}/emacs

# use-package build here and put in site-lisp

test -d ${SRC_DIR}/use-package || git clone git@github.com:jwiegley/use-package.git ${SRC_DIR}/use-package

# https://jwiegley.github.io/use-package/installation/
#cd ~/.emacs.d/src/use-package
#git co -b 2.4-tag refs/tags/2.4
#echo -e "LOAD_PATH = -L ~/.emacs.d/src/use-package\nMAKEINFO = /usr/local/opt/texinfo/bin/makeinfo" > ~/.emacs.d/src/use-package/config.mk
#make

# git clone lsp servers

DIR=${SRC_DIR}/lsp-servers

test -d $DIR || mkdir $DIR

# Java
test -d $DIR/eclipse.jdt.ls || git clone https://github.com/eclipse/eclipse.jdt.ls $DIR/eclipse.jdt.ls

# Javascript/Typescript
test -d $DIR/javascript-typescript-langserver || git clone https://github.com/sourcegraph/javascript-typescript-langserver $DIR/javascript-typescript-langserver

# Python
test -d $DIR/pyls || git clone https://github.com/palantir/python-language-server $DIR/pyls

# Go
test -d $DIR/go-langserver || git clone https://github.com/sourcegraph/go-langserver $DIR/go-langserver

# Kotlin
test -d $DIR/KotlinLanguageServer || git clone https://github.com/fwcd/KotlinLanguageServer $DIR/KotlinLanguageServer

# C/C++ 17
test -d $DIR/ccls || git clone https://github.com/MaskRay/ccls $DIR/ccls

# C/C++ 14
test -d $DIR/cquery || git clone https://github.com/cquery-project/cquery $DIR/cquery

# Ruby
test -d $DIR/solargraph || git clone git@github.com:castwide/solargraph.git $DIR/solargraph

# Rust
test -d $DIR/rls || git clone https://github.com/rust-lang/rls $DIR/rls

# Clojure
test -d $DIR/clojure-lsp || git clone https://github.com/snoe/clojure-lsp $DIR/clojure-lsp

# Scala
test -d $DIR/metals || git clone https://github.com/scalameta/metals $DIR/metals

# JDEE client and server

JDIR=${SRC_DIR}/jdee-emacs

test -d $JDIR || mkdir -p $JDIR

test -d $JDIR/jdee || git clone git@github.com:jdee-emacs/jdee.git $JDIR/jdee

test -d $JDIR/jdee-server || git clone git@github.com:jdee-emacs/jdee-server.git $JDIR/jdee-server

test -d $JDIR/beanshell || git clone git@github.com:beanshell/beanshell.git $JDIR/beanshell


# tags

TDIR=${SRC_DIR}/tags

# http://ctags.sourceforge.net/
CTAG_VER=5.8
CTAG_FILE=${TDIR}/ctags-${CTAG_VER}.tar.gz
CTAG_URL=http://prdownloads.sourceforge.net/ctags/ctags-${CTAG_VER}.tar.gz

# http://savannah.gnu.org/projects/global/
GTAG_VER=6.6.2
GTAG_FILE=${TDIR}/global-${GTAG_VER}.tar.gz
GTAG_URL=http://tamacom.com/global/global-${GTAG_VER}.tar.gz

test -d ${TDIR} || mkdir -p ${TDIR}

test -f ${CTAG_FILE} || curl -L ${CTAG_URL} -o ${CTAG_FILE}
test -d ${TDIR}/ctags-${CTAG_VER} || (pushd ${TDIR} && tar xzf ${CTAG_FILE} && popd)

test -f ${GTAG_FILE} || curl -L ${GTAG_URL} -o ${GTAG_FILE}
test -d ${TDIR}/global-${GTAG_VER} || (pushd ${TDIR} && tar xzf ${GTAG_FILE} && popd)
