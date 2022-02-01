<div align="center">

# dockerfiles

[![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square&labelColor=000000)](#license)

***A repository containing my personal `dockerfiles`***

</div>

## Usage

* Show the list of available commands:

    ```bash
    $ make
    all                            Build and push all docker images
    build                          Build and push a docker images (arg: IMAGE=<image>)
    interact                       Interact with a docker image (arg: IMAGE=<image>)
    ```

* Build the `ubuntu2004` image:

    ```
    make build IMAGE=ubuntu2004
    ```

* Configure by modifying `Makefile`:

    ```
    USER=<your_dockerhub_username>
    ```
