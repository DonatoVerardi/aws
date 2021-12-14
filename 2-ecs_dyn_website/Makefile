include config.mk

.PHONY: deploy
deploy:
	@echo ":::deploying the application to aws"	
	aws cloudformation deploy --stack-name ${AWS_STACK_NAME} --template-file templates/ecs_dyn_website_stack.yml --parameter-override ECRName=${AWS_ECR_NAME} --parameter-override AWSAccountID=${AWS_ACCOUNT_ID} --parameter-override AWSRegion=${AWS_REGION}


.PHONY: push
push:
	@echo ":::deploying the application to aws"	
	docker pull nginxinc/nginx-unprivileged:1.20
	aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
	docker tag nginxinc/nginx-unprivileged:1.20 ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${AWS_ECR_NAME}:latest
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${AWS_ECR_NAME}:latest


.PHONY: clean
clean:
	@echo ":::deleting the application"
	aws ecr batch-delete-image --repository-name=donato --image-ids imageTag=latest
	aws cloudformation delete-stack --stack-name ${AWS_STACK_NAME}
		