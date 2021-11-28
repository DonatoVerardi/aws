include config.mk

.PHONY: deploy
deploy:
	@echo ":::deploying the application to aws"	
	aws cloudformation deploy --stack-name ${AWS_STACK_NAME} --template-file ${AWS_STACK_FILENAME} --parameter-override BucketName=${AWS_BUCKET_NAME} --parameter-override DomainName=${AWS_DOMAIN_NAME}
	aws s3 cp --recursive website s3://${AWS_BUCKET_NAME}

.PHONY: update
update:
	@echo ":::updating the application to aws"	
	aws cloudformation deploy --stack-name ${AWS_STACK_NAME} --template-file ${AWS_STACK_FILENAME} --parameter-override BucketName=${AWS_BUCKET_NAME} --parameter-override DomainName=${AWS_DOMAIN_NAME}	



.PHONY: clean
clean:
	@echo ":::deleting the application"
	aws s3 rm --recursive s3://${AWS_BUCKET_NAME}
	aws cloudformation delete-stack --stack-name ${AWS_STACK_NAME}
		