module "ecr" {
  source                   = "../"
  repository_names         = ["example1", "example2"]
  org_unit                 = "test"
  image_tag_mutability     = "MUTABLE"
  scan_on_push             = true
  max_untagged_image_count = 3
  max_tagged_image_count   = 30
  identifiers              = ["12345122343"]
}
