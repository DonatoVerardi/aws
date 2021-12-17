include config.mk

.PHONY: deploy
deploy:
	@echo "::::::::::::::::::::::::::::"
	@echo ":::: DEPLOY APP TO AWS  ::::"
	@echo "::::::::::::::::::::::::::::"
	aws cloudformation deploy --stack-name staticWebsite --template-file templates/static_website_stack.yml --parameter-overrides BucketName=${AWS_BUCKET_NAME} DomainName=${AWS_DOMAIN_NAME} CertificateARN=${AWS_CERTIFICATE_ARN}
	@echo "::::::::::::::::::::::::::::"
	@echo ":::: COPY WEBSITE TO S3 ::::"
	@echo "::::::::::::::::::::::::::::"
	aws s3 cp --recursive website s3://${AWS_BUCKET_NAME}


.PHONY: clean
clean:
	@echo "::::::::::::::::::::::::::::"
	@echo ":::: DELETE APP         ::::"
	@echo "::::::::::::::::::::::::::::"
	aws s3 rm --recursive s3://${AWS_BUCKET_NAME}
	aws cloudformation delete-stack --stack-name staticWebsite
		