#!/bin/bash

function err {
    echo "ERROR: $@"
    exit 1
}

current_directory="$(pwd)"

# Check for Docker
which docker &>/dev/null || err "Docker is required to run Ansible playbooks."

# Validate the Docker image is available (assuming images are named)
docker_image="$1"
docker images | awk "{ print \$1 \":\" \$2 }" | grep "$1" &>/dev/null || err "Could not find Docker image: $docker_image"

# Create symlinks to previous directory (assumes the influxdb module is in a module directory)
# module_dirs="$(ls -1 ../)"
# echo "Creating symlinks for each folder in '$(dirname $current_directory)' so that Ansible can find them..."
# for dir in ${module_dirs[@]}; do
#     test -h ./$dir && err "Stopping due to current directory containing symlink $dir"
#     test -d ./$dir && err "Stopping due to current directory containing dir $dir"
#     ln -s ../$dir $dir
# done

echo "Running in Docker: $@"
docker run \
       --rm \
       -v $(pwd):/root \
       $@

# Remove symlinks so that current directory is clean
# echo "Clearing symlinks..."
# for dir in ${module_dirs[@]}; do rm $dir; done

exit 0
