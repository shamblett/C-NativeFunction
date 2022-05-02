#!/bin/bash
#
# C example builder
#
rm add writeln sumstring 2> /dev/null
gcc add.c -o add
gcc writeln.c -o writeln
gcc sumstring.c -o sumstring
