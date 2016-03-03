#!/bin/sh

# TODO: improve

installdir=~/

cp -r .emacs.d ${installdir}
cp .gitconfig .gitignore .screenrc .tcshrc ${installdir}

