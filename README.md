# illegal-ltfs-characters

### Background:
LTFS (Linear Tape File System) considers next characters illegal: `* ? < > " | \`{:.bash}

### Description:
This script takes an entrypoint location and replaces illegal LTFS
characters from the target location recursively by the "_" character,
so that folder content can be transferred to a LTO tape using LTFS

### How to use it:
`$ replace_forbidden_chars.sh <entrypoint_folder>`{:.bash}

#### Notes:
only `"`{:.bash} and `\`{:.bash} characters have to be scaped in the context of filenames
