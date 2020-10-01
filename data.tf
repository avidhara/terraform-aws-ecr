data "template_file" "lifecycle_policy" {
  template = file("${path.module}/lifecycle-policy.tpl.json")

  vars = {
    max_untagged_image_count = var.max_untagged_image_count
    max_tagged_image_count   = var.max_tagged_image_count
  }
}
