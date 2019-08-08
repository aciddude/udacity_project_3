

## Get AWS Availability Zones
data "aws_availability_zones" "available" {
  state = "available"
}

## Get Latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name = "name"

    values = [
      "amzn2-ami-hvm-*-x86_64-gp2",
    ]
  }
  
  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}
