INFRA_PATH = $(PWD)/infra

.PHONY: init validate plan apply destroy lint

init:
	cd $(INFRA_PATH) && terraform init

validate: init
	cd $(INFRA_PATH) && terraform validate

plan: validate
	cd $(INFRA_PATH) && terraform plan

apply: validate
	cd $(INFRA_PATH) && terraform apply

destroy: validate
	cd $(INFRA_PATH) && terraform destroy

lint:
	pre-commit run --all-files
