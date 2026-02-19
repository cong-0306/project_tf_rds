primary_region = "ap-northeast-2"
dr_region      = "ap-southeast-1"

vpc_id = "vpc-069ef21d610649ec0"

db_subnet_ids = [
  "subnet-07bdc3a689b2e35f2",
  "subnet-087f9f1be9d987b01"
]

rosa_node_sg_id = "sg-0d5a7a009e5ddeb84"

db_identifier = "rosa-main-rds"
db_name       = "app_db"
db_username   = "postgres"
db_password   = "postgres"

engine_version    = "15.15"
instance_class    = "db.t3.micro"
allocated_storage = 20

backup_retention_period   = 1
backup_replication_region = "ap-southeast-1"

replica_identifier     = "rosa-main-rds-replica"
replica_instance_class = "db.t3.micro"

publicly_accessible = false
multi_az            = false

tags = {
  Project = "rosa"
  Env     = "dev"
  Service = "database"
}