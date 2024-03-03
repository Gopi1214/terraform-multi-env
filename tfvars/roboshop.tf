resource "aws_instance" "servers" {
  for_each = var.instance_name
  ami           = data.aws_ami.centos8
  instance_type = each.value
  
  tags = {
    Name =  each.key
  }
}


resource "aws_route53_record" "DNS" {
  for_each  = aws_instance.servers
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [startswith(each.key == "web") ? each.value.public_ip : each.value.private_ip]
}