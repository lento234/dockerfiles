.DEFAULT_GOAL := help

USER=mrlento234

PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: all
all: ## Build and push all docker images
	@$(CURDIR)/build.sh all

build: ## Build and push a docker images (arg: I=<image>)
	@$(CURDIR)/build.sh $(I)

.PHONY: interact
interact: ## Interact with a docker image (arg: I=<image>)
	docker run -it --rm $(USER)/$(I) bash

