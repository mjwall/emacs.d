#!/bin/bash

# git clone emacs source

SRC_DIR=${HOME}/.emacs.d/src

test -d ${SRC_DIR}/emacs || git clone git@github.com:emacs-mirror/emacs.git ${SRC_DIR}/emacs

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






