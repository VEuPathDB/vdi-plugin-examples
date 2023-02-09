nothing:
	@echo "Example Tasks:"
	@echo ""
	@echo "build-bash-example"
	@echo "    Builds the bash example Docker image."
	@echo ""
	@echo "run-bash-example"
	@echo "    Runs the bash example Docker container."
	@echo ""
	@echo "build-go-example"
	@echo "    Builds the go example Docker image."
	@echo ""
	@echo "run-go-example"
	@echo "    Runs the go example Docker container."
	@echo ""
	@echo "build-java-example"
	@echo "    Builds the java example Docker image."
	@echo ""
	@echo "run-java-example"
	@echo "    Runs the java example Docker container."
	@echo ""
	@echo "build-perl-example"
	@echo "    Builds the perl example Docker image."
	@echo ""
	@echo "run-perl-example"
	@echo "    Runs the perl example Docker container."
	@echo ""
	@echo "build-python-example"
	@echo "    Builds the python example Docker image."
	@echo ""
	@echo "run-python-example"
	@echo "    Runs the python example Docker container."

build-bash-example:
	@docker build \
		-t vdi-handler-bash-example \
		examples/bash

run-bash-example:
	@docker run \
		-it \
		--rm \
		-p 8080:8080 \
		--env-file=.env \
		vdi-handler-bash-example

build-go-example:
	@docker build \
		-t vdi-handler-go-example \
		examples/go

run-go-example:
	@docker run \
		-it \
		--rm \
		-p 8080:8080 \
		--env-file=.env \
		vdi-handler-go-example

build-java-example:
	@docker build \
		-t vdi-handler-java-example \
		examples/java

run-java-example:
	@docker run \
		-it \
		--rm \
		-p 8080:8080 \
		--env-file=.env \
		vdi-handler-java-example

build-perl-example:
	@docker build \
		-t vdi-handler-perl-example \
		examples/perl

run-perl-example:
	@docker run \
		-it \
		--rm \
		-p 8080:8080 \
		--env-file=.env \
		vdi-handler-perl-example

build-python-example:
	@docker build \
		-t vdi-handler-python-example \
		examples/python

run-python-example:
	@docker run \
		-it \
		--rm \
		-p 8080:8080 \
		--env-file=.env \
		vdi-handler-python-example
