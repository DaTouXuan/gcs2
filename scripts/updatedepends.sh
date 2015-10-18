#!/bin/bash

cd "$(git rev-parse --show-toplevel)"

echo "Recursively updating submodules"
git submodule update --init --recursive
