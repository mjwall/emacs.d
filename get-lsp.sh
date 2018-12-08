#!/bin/bash

# git clone lsp servers

DIR=${HOME}/.emacs.d/lsp-servers

test -d $DIR || mkdir $DIR

# Java
test -d $DIR/eclipse.jdt.ls || git clone https://github.com/eclipse/eclipse.jdt.ls $DIR/eclipse.jdt.ls

# Javascript/Typescript

# Python

# Go

# Kotlin

# C/C++

# Ruby

# Rust


# https://github.com/sourcegraph/javascript-typescript-langserver
# https://github.com/sourcegraph/go-langserver
# https://github.com/palantir/python-language-server
# https://github.com/fwcd/KotlinLanguageServer

# https://github.com/MaskRay/ccls or https://github.com/cquery-project/cquery
