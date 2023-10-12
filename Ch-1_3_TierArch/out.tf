output "lb_dns_name" {
  description = "DNS HOST Name Of LB"
  value       = aws_lb.external-elb.dns_name
}