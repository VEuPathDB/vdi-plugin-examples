nothing:
	@echo "Example Tasks:"
	@echo ""
	@echo "build-bash-example"
	@echo "    Builds the bash example Docker image."
	@echo ""
	@echo "run-bash-example"
	@echo "    Runs the bash example Docker container."
	@echo ""
	@echo "build-perl-example"
	@echo "    Builds the perl example Docker image."
	@echo ""
	@echo "run-perl-example"
	@echo "    Runs the perl example Docker container."

build-bash-example:
	@docker build \
		-t vdi-handler-bash-example \
		bash-example

run-bash-example:
	@docker run \
		-it \
		--rm \
		--env-file=example.env \
		vdi-handler-bash-example

build-perl-example:
	@docker build \
		-t vdi-handler-perl-example \
		perl-example

run-perl-example:
	@docker run \
		-it \
		--rm \
		--env-file=example.env \
		vdi-handler-perl-example
