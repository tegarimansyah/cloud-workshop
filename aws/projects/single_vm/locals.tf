locals {
  tags = {
    Source      = "Open Cloud Workshop"
    Project     = "Single VM for many apps"
    Contact     = "@tegarimansyah"
    Terraform   = "true"
    Environment = "${terraform.workspace}"
  }
}