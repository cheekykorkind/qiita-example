#!/bin/sh

echo 'install pip package'
docker exec pip_installer /bin/sh -e -c "
apk add zip terraform==0.12.6-r0
cd ./hello_world

pip install -t ./packages -r requirements.txt
zip -r9 \$LAMBDA_ZIP_PATH .

echo 'Go to main.tf directory'
cd \$TERRAFORM_PATH

terraform init

terraform apply -auto-approve -var="lambda_zip_path=\$LAMBDA_ZIP_PATH"

exit
"
docker stop pip_installer
docker rm pip_installer