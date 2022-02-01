#!/bin/bash
set -e
set -o pipefail

# USER=mrlento234

build_image () {
    IMAGE=$1
   
    cd $IMAGE

    echo -e "\e[31m Building \e[1m${USER}/${IMAGE}\e[0m\e[31m ...\e[0m"
	DOCKER_BUILDKIT=1 docker build --progress=auto -t $USER/$IMAGE .
    echo -e "\e[32m Build \e[1m${USER}/${IMAGE}\e[0m\e[32m.\e[0m\n"
    
    cd ..

}

push_image () {
    IMAGE=$1
    
    cd $IMAGE

    echo -e "\e[31m Pushing \e[1m${USER}/${IMAGE}\e[0m\e[31m ...\e[0m"
    docker push $USER/$IMAGE:latest
    echo -e "\e[32m Pushed \e[1m${USER}/${IMAGE}\e[0m\e[32m.\e[0m\n"
    
    cd ..

}

build_and_push_all () {
    
    # get the dockerfiles
    for i in `find . -name "Dockerfile" | cut -d '/' -f2`
    do
        build_image $i
        push_image $i
    done

}

build_and_push () {
    build_image $1
    push_image $1
}

main () {
    if [ $1 == "all" ]; then
        build_and_push_all $1
    else
        build_and_push $1
    fi
}


main $1
