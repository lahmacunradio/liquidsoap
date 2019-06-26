#!/bin/bash


self=$0

# print an error
fatal () {
  echo "$self:" "$@" >&2
  exit 1
}

copy_container_data() {
  echo "$self: copying $1..."
  cp -r "$1" "$2"
  echo "$self: data copy finished successfully"
}

main () {
    
    if [ $# -eq 0 ]; then
        fatal "please specify archive source path"
        exit
    fi
    
    src="$1"

    # so we don't add this huge data blob to the repo we create archive in the
    # parent folder. No need to gitignore this way either
    cd $(dirname $self)
    # date=$(date +%F)
    # dst="$(pwd)/../archive-$date"
    # TODO Do we want to timestamp the folders?
    dst="$(pwd)/../archive"

    if ! [ -d $dst ]; then
        mkdir -p $dst
    fi

    if ! [ -d $src ]; then
        fatal "source path to be archived is not a folder it seems"
    else
        copy_container_data $src $dst
    fi
}

main "${@}"