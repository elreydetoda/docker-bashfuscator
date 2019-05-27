# Bashfuscator options

**NOTE**: I created this, so I don't have to keep doing `--help` to figure out all the options. This is a static file, so this could be out of date but this was only for the initial instantiation of the Dockerfile

```
[Program Options]
-l, --list            List all the availible obfuscators, compressors, and
                      encoders
-c COMMAND, --command COMMAND
                      Command to obfuscate
-f FILE, --file FILE  Name of the script to obfuscate
--stdin               Obfuscate stdin
-o OUTFILE, --outfile OUTFILE
                      File to write payload to
-q, --quiet           Print only the payload
--clip                Copy the payload to clipboard
--test                Test the payload after running it. Not compatible with
                      -q
[obfuscation options]
-s {1,2,3}, --payload-size {1,2,3}
                      Desired size of the payload. Default: 2
-t {1,2,3}, --execution-time {1,2,3}
                      Desired speed of the payload. Default: 2
--layers LAYERS       Number of layers of obfuscation to apply. Default is 1
                      when --choose-mutators is used, otherwise: 2
--include-binaries BINARIES [BINARIES ...]
                      Binaries you exclusively want used in the generated
                      payload
--exclude-binaries BINARIES [BINARIES ...]
                      Binaries you don't want to be used in the generated
                      payload
--no-file-write       Don't use obfuscators that require writing to files
--write-dir WRITE_DIR
                      Directory to use if Mutators need to write to or
                      create files

Advanced Options:
--choose-mutators MUTATOR [MUTATOR ...]
                      Manually choose what mutators are used in what order
--choose-all MUTATOR [MUTATOR ...]
                      Manually choose what mutators and their stubs if
```
