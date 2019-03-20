#!/bin/bash


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
    echo "$self: checking if running container with this name is available..."
    if [[ $(docker ps --no-trunc -qf "name=$container_name" --format '{{.Names}}') == $container_name ]];
    then
        return 0
    else
        return 1
    fi
}

copy_container_host() {
  echo "$self: copying $1..."
  docker cp "$1" "$2"
  echo "$self: data copy finished successfully"
}

main () {
    
    if [ $# -eq 0 ]; then
        fatal "please specify archive source and destination paths"
        exit
    fi
    
    image_based_container_name=$(docker ps | awk '$2=="azuracast/azuracast_web_v2:latest" { print $1 }')
    src="$image_based_container_name:$1"
    # so we don't add this huge data blob to the repo we create archive in the
    # parent folder. No need to gitignore this way either
    dst="$(pwd)/../archive"

    if ! is_container "$src"; then
        fatal "there is no container with this name running"
        exit
    fi 

    cd $(dirname $self)

    if ! [ -d $dst ]; then
        mkdir -p $dst
    fi

    copy_container_host $src $dst
}

main "${@}"