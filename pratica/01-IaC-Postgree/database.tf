resource "aws_db_instance" "RDS_Postgre_PizzaDB" {
  allocated_storage      = 20
  db_name                = "pizzaDB"
  engine                 = "postgres"
  engine_version         = "14.8"
  instance_class         = "db.m5.large"
  username               = "pizza123"
  password               = "pizza123"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_subnet.subnet_priv_1a.id
  vpc_security_group_ids = [aws_security_group.sg_rds_postgres.id]
  multi_az               = true
  tags                   = merge(local.common_tags, var.priv_subnet_1a)
}