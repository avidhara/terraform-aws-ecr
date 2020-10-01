locals {
  ecr_repository_count = length(var.repository_names) > 0 ? length(var.repository_names) : 0
}


resource "aws_ecr_repository" "this" {
  count                = local.ecr_repository_count
  name                 = format("%s/%s", var.org_unit, var.repository_names[count.index])
  image_tag_mutability = var.image_tag_mutability
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  tags = merge(
    {
      "Name" = var.repository_names[count.index]

    },
    var.tags
  )

  # lifecycle {
  #   create_before_destroy = true
  #   ignore_changes = [
  #     tags
  #   ]
  # }
}

resource "aws_ecr_lifecycle_policy" "this" {
  count      = local.ecr_repository_count
  policy     = data.template_file.lifecycle_policy.rendered
  repository = aws_ecr_repository.this[count.index].name
}

