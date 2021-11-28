include config.mk

.PHONY: deploy
deploy:
	@echo ":::deploying the application to aws"	
	aws cloudformation deploy --stack-name staticWebsite --template-file templates/static_website_stack.yml 
	aws s3 cp --recursive website s3://${AWS_BUCKET_NAME}

.PHONY: update
update:
	@echo ":::updating the application to aws"	
	aws cloudformation deploy --stack-name staticWebsite --template-file templates/static_website_stack.yml 



.PHONY: clean
clean:
	@echo ":::deleting the application"
	aws s3 rm --recursive s3://${AWS_BUCKET_NAME}
	aws cloudformation delete-stack --stack-name staticWebsite
		