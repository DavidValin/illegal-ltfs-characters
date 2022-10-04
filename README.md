# illegal-ltfs-characters

### Background:
LTFS (Linear Tape File System) considers next characters illegal: `* ? < > " | \`

### Description:
This script takes an entrypoint location and replaces illegal LTFS
characters from the target location recursively by the "_" character,
so that folder content can be transferred to a LTO tape using LTFS

### How to use it:
`$ replace_forbidden_chars.sh <entrypoint_folder>`
