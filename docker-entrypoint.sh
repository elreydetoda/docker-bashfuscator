#!/bin/bash

set -exuo pipefail

bin_path="/usr/local/bin"

prep_next_arg(){
  tmp_str=''
  export tmp_str
}

append_str(){
  tmp_str="${tmp_str} + ${1}"
  export tmp_str

}

# TODO: finish parser
# body: write a parser to interpret where commands being and end. Here are a few things to consider.
  # parse **Program Options** [here](https://github.com/elreydetoda/docker-bashfuscator/blob/master/bashfuscator_options.md) which are necessary to the function of the program. 
  # - these will tell you what you will be reading in from for the obfuscation
parse(){
  # this function is to parse bashfuscation arguments, because docker
  # doesn't allow quotes from being passed through unless it is env variables
  # which would dissrupt the flow of this application too much instead
  # of treating it like how it supposed to do and keep appending

  # TODO: Implement reading from stdin
  # body: Need to work on trying to check for the parser function if input
    # can be read from stdin from a docker container, I am thinking yes if
    # someone does `-- <(file_path)` at the end of running a container, but
    # need to validate this later down the road.

  # TODO: use bind mount to access file
  # body: use the `-v` option to bind mount a file to be allowed to be read
    # by bashfuscator, so that way the file can be accessed from within the
    # docker container. Throw error if not mounted

  parsed_string=()
  tmp_str=''
  oldIFS="${IFS}"
  IFS=' '
  for given_string in "${@}" ; do

    # first argument getting passed to bashfuscator is a flag indicating what
    # you want to invoke the obfuscation on (i.e. enter in a command (-c) in
    # from a file (-f), list this options (-l)

    case "${given_string}" in
      -c)
        if [[ -z "${tmp_str}" ]] ; then
          parsed_string+=("${given_string}")
        else
          append_str "${given_string}"
        fi
    esac

  done
  IFS="${oldIFS}"
  export parsed_string
}

main(){
  case "$1" in
    bashrc)
        /usr/local/bin/register-python-argcomplete bashfuscator
      ;;
    --help)
      "${bin_path}/bashfuscator" "$@"
      # printf "If you want to be able to copy this to your clipboard append the following to normal execution: "
      # printf "-"
      ;;
    bash)
      "${bin_path}/bashfuscator" "$@"
      ;;
    *)
      echo "${@}"
      parse "${@}"
      
      # TODO: output command to stdout
      # body: always append `--output -` to the end of a command so it is outputted to stdout and the user can append `-- | clipcopy` or `xclip` or whatever their clipboard manager is (i.e. `clip.exe` for windows or `pbcopy` for osx) so it get's copied to their clipboard.
        # - the `--` at the end of the command will allow docker to realize that there are no more args getting passed to it. (i.e. `docker container run --rm -it bashfuscator -- | less`
      # "${bin_path}/bashfuscator" "$@"
      ;;
  esac
}

main "${@}"
