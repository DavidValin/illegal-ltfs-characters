#!/bin/bash --

# Background:
# ==========================================================================
#   LTFS (Linear Tape File System) considers next characters illegal:
#   * ? < > " | \
#
# Description:
# ==========================================================================
#   This script takes an entrypoint location and replaces illegal LTFS
#   characters from the target location recursively by the "_" character,
#   so that folder content can be transferred to a LTO tape using LTFS
#
# How to use it:
# ==========================================================================
#   $ replace_forbidden_chars.sh <entrypoint_folder>
#
# Notes:
#   only " and \ characters have to be scaped in the context of filenames

find ${args[1]} -depth -regex ".*[*?<>\"|\\].*" -print0 | while IFS= read -rd '' path
do
  directory=${path%/*}
  filename=${path##*/}
  clean_filename=${filename//[*?<>\"|\\]/_}
  if [[ $filename != "$clean_filename" ]]; then
    src=$directory/$filename
    dest=$directory/$clean_filename
    printf -- '- renaming %s to %s\n' "$filename" "$clean_filename"
    mv -- "$src" "$dest"
  fi
done
