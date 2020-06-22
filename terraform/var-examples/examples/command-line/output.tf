# terraform init
# terraform apply -var="lambda-zip-path=my-zip-path"
output "output-lambda-zip-path" {
  value = var.lambda-zip-path
}

# terraform init
# terraform apply -var-file="tfvars-exam.tfvars"
output "output-tfvars-region" {
  value = var.tfvars-region
}