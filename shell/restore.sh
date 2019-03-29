#!/bin/bash

DIR="$( pwd )"
echo $DIR

cd $DIR/sonic-sairedis

git checkout configure.ac

cd $DIR/sonic-sairedis/SAI/meta

git checkout Makefile