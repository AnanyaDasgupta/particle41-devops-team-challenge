data "aws_iam_role" "ecs-autoscale" {
   name = "AWSServiceRoleForApplicationAutoScaling_ECSService"
 }
data "aws_ssm_parameter" "ecs_optimized_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended"
}