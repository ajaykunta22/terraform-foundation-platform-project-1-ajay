output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}
output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}
output "ec2_instance_profile_name" {
  value = module.iam.ec2_instance_profile_name
}

output "ec2_role_name" {
  value = module.iam.ec2_role_name
}
output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ec2_security_group_id" {
  value = module.ec2.security_group_id
}