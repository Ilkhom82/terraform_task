locals {
    common_tags = {
        Project     = "VPC_Task"
        Environment = "Test"
        Team        = "DevOps"
        Created_by  = "Ilkhom"
    }
}


resource "aws_instance" "myinstance1" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  key_name = "bastion-key"

  subnet_id = aws_subnet.subnet-public-1.id

 
  vpc_security_group_ids = ["${aws_security_group.ec2-sg.id}"]
  
  user_data = "ICAgICAgICAgICAgICAjIS9iaW4vYmFzaAogICAgICAgICAgICAgIHl1bSBpbnN0YWxsIGh0dHBkIC15CiAgICAgICAgICAgICAgc2VydmljZSBodHRwZCBzdGFydAogICAgICAgICAgICAgIGNoa2NvbmZpZyBodHRwZCBvbgogICAgICAgICAgICAgIGVjaG8gIkhlbGxvLCB3b3JsZCIgPiAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWw="

  tags = local.common_tags 

}

resource "aws_instance" "myinstance2" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  key_name = "bastion-key"

  subnet_id = aws_subnet.subnet-public-2.id

  
  vpc_security_group_ids = ["${aws_security_group.ec2-sg.id}"]

  user_data = "ICAgICAgICAgICAgICAjIS9iaW4vYmFzaAogICAgICAgICAgICAgIHl1bSBpbnN0YWxsIGh0dHBkIC15CiAgICAgICAgICAgICAgc2VydmljZSBodHRwZCBzdGFydAogICAgICAgICAgICAgIGNoa2NvbmZpZyBodHRwZCBvbgogICAgICAgICAgICAgIGVjaG8gIkhlbGxvLCB3b3JsZCIgPiAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWw="

  tags = local.common_tags

}

resource "aws_instance" "myinstance3" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  key_name = "bastion-key"

  subnet_id = aws_subnet.subnet-public-3.id


  vpc_security_group_ids = ["${aws_security_group.ec2-sg.id}"]

  user_data = "ICAgICAgICAgICAgICAjIS9iaW4vYmFzaAogICAgICAgICAgICAgIHl1bSBpbnN0YWxsIGh0dHBkIC15CiAgICAgICAgICAgICAgc2VydmljZSBodHRwZCBzdGFydAogICAgICAgICAgICAgIGNoa2NvbmZpZyBodHRwZCBvbgogICAgICAgICAgICAgIGVjaG8gIkhlbGxvLCB3b3JsZCIgPiAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWw="
   
  tags = local.common_tags
   

}

