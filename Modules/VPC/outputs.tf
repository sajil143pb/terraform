output "vpc_id" {
    value = aws_vpc.prod.id
}

output "public_subnets"{
    value = aws_subnet.prod_public.id
}

output "private_subnets"{
    value = aws_subnet.prod_private.id
}

# output "public_route_table_id" {
#   description = "ID of the public route table"
#   value       = aws_route_table.aws_route_prod.id
# }