#!/bin/bash
set -e
set -o pipefail

USER=mrlento234

build_image () {
    IMAGE=$1

	DOCKER_BUILDKIT=1 docker build --progress=auto -t $USER/$IMAGE .

}

push_image () {
    IMAGE=$1

    docker push $USER/$IMAGE:latest
}

build_push_all () {
    
    # get the dockerfiles
    for i in `find . -name "Dockerfile" | cut -d '/' -f2`
    do
        # Building images
        echo -e "\e[31m Building \e[1m${USER}/${i}\e[0m\e[31m ...\e[0m"
        cd $i
        build_image $i
        cd ..
        echo -e "\e[32m Build \e[1m${USER}/${i}\e[0m\e[32m.\e[0m\n"

        # Pushing images to dockerhub
        push_image $i
        echo -e "\e[32m Pushed \e[1m${USER}/${i}\e[0m\e[32m.\e[0m\n"
    done

}

build_push_all
