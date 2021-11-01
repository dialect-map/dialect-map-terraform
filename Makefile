MAIN_MODULE = "config"


.PHONY: clean
clean:
	@rm -rf "$(MAIN_MODULE)/.terraform"
	@rm -rf "$(MAIN_MODULE)/.terraform.lock.hcl"


.PHONY: check
check:
	@terraform fmt -check -diff -recursive .


.PHONY: validate
validate:
	@terraform -chdir=$(MAIN_MODULE) init -backend=false
	@terraform -chdir=$(MAIN_MODULE) validate
	@$(MAKE) clean


.PHONY: apply
apply:
	@terraform -chdir=$(MAIN_MODULE) init
	@terraform -chdir=$(MAIN_MODULE) apply -auto-approve
	@$(MAKE) clean
