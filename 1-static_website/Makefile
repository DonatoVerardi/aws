include config.mk

.PHONY: apply
apply:
	@echo ":::deploying the application to aws"	
	aws cloudformation deploy --stack-name ${AWS_STACK_NAME} --template-body file://${AWS_STACK_FILENAME}

.PHONY: delete
delete:
	@echo ":::deleting the application"
	aws cloudformation delete-stack --stack-name ${AWS_STACK_NAME}