.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

generate-tf-docs: ## Generate README.md in each project. Usage: `make generate-tf-docs PROJECT=aws/modules/ec2`
	terraform-docs -c .tfdocs-config.yml ${PROJECT} > ${PROJECT}/README.md

tf:
	terraform -chdir=${PROJECT} ${CMD}