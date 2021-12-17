include config.mk

.PHONY: deploy
deploy:
	@echo "::::::::::::::::::::::::::::"
	@echo ":::: CREATE REPOSITORY  ::::"
	@echo "::::::::::::::::::::::::::::"
	aws cloudformation deploy --stack-name fargate-ecr --template-file templates/ecr_stack.yml --parameter-overrides ImageName=${AWS_IMAGE_NAME} 	
	@echo "::::::::::::::::::::::::::::"
	@echo ":::: PUSHING IMAGE      ::::"
	@echo "::::::::::::::::::::::::::::"
	docker pull nginxinc/nginx-unprivileged:1.20
	aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
	docker tag nginxinc/nginx-unprivileged:1.20 ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${AWS_IMAGE_NAME}:latest
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${AWS_IMAGE_NAME}:latest	
	@echo "::::::::::::::::::::::::::::"
	@echo ":::: CREATE CLUSTER     ::::"
	@echo "::::::::::::::::::::::::::::"
	aws cloudformation deploy --stack-name fargate-cluster --template-file templates/cluster_stack.yml --parameter-overrides ImageName=${AWS_IMAGE_NAME} AWSAccountID=${AWS_ACCOUNT_ID} AWSRegion=${AWS_REGION}


.PHONY: clean
clean:
	@echo "::::::::::::::::::::::::::::"
	@echo ":::: DELETE CLUSTER     ::::"
	@echo "::::::::::::::::::::::::::::"
	aws cloudformation delete-stack --stack-name fargate-cluster
	aws ecr batch-delete-image --repository-name=${AWS_IMAGE_NAME} --image-ids imageTag=latest
	aws cloudformation delete-stack --stack-name fargate-ecr