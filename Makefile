
.PHONY: help
help: ## Prints help (only for targets with comments)
	@grep -E '^[a-zA-Z0-9._-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; \
{printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

fetch_dependencies: ## Downloads dependent roles from ansible-galaxy to the path specified in 'ansible.cfg'.
	ansible-galaxy install -r requirements.yml --force