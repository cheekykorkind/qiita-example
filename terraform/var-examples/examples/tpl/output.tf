
# https://www.terraform.io/docs/configuration/functions/templatefile.html
output "output-s3-policy-template" {
  value = templatefile("${path.root}/s3-policy-template.tpl", {
    my-value = "goodddddddddddddddddddddddddd"
  })
}


# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_AWSCLI_Fargate.html#ECS_AWSCLI_Fargate_register_task_definition

# https://www.terraform.io/docs/configuration/functions/file.html
# https://www.terraform.io/docs/providers/template/d/file.html
data "template_file" "ecs-task-definition" {
  template = "${file("${path.root}/ecs-task-definition.json.tpl")}"

  vars = {
    my-farmily-name = "yesssssssssssssssssssssssssssssssssssss"
  }
}

output "output-template-two" {
  value = data.template_file.template-two.rendered
}
