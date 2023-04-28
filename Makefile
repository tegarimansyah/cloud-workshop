.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

generate-tf-module-docs: ## Generate README.md in each project. Usage: `make generate-tf-module-docs PROJECT=aws/modules/ec2`
	terraform-docs -c .tfdocs-modules-config.yml ${PROJECT} > ${PROJECT}/README.md

generate-tf-project-docs: ## Generate README.md in each project. Usage: `make generate-tf-project-docs PROJECT=aws/modules/ec2`
	terraform-docs -c .tfdocs-projects-config.yml ${PROJECT} > ${PROJECT}/README.md

tf:
	terraform -chdir=${PROJECT} ${CMD}