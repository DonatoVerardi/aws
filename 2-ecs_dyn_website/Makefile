include config.mk

.PHONY: deploy
deploy:
	@echo ":::deploying the application to aws"	
	aws cloudformation deploy --stack-name ${AWS_STACK_NAME} --template-file templates/ecs_dyn_website_stack.yml --parameter-override ECRName=${AWS_ECR_NAME}


.PHONY: clean
clean:
	@echo ":::deleting the application"
	aws cloudformation delete-stack --stack-name ${AWS_STACK_NAME}
		