#!/bin/sh

self=$0

# print an error
fatal () {
  echo "$self:" "$@" >&2
  exit 1
}

is_container() {
    # suppose the input string is the argument needed for 'docker cp'
    # eg. in the form of: 'docker_container_name:/path/to/folder_or_file'
    container_name=${1%:*}
    echo "$self: $container_name"
    echo "$self: testing..."
    if [[ $(docker ps -f "name=$container_name" --format '{{.Names}}') == $container_name ]];
    then
        return 0
    else
        return 1
    fi
}

copy_container_host() {
  docker cp "$1" "$2"
}

main () {
    
    if [ $# -eq 0 ]; then
        fatal "please specify archive source and destination paths"
        exit
    fi
    
    src=$1
    dst="../archive"

    if ! is_container "$src"; then
        fatal "there is no container with this name running"
        exit
    fi 

    if ! [ -d $dst ]; then
        mkdir -p $dst
    fi

    copy_container_host $src $dst
}

main "${@}"