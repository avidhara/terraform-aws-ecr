data "aws_iam_policy_document" "this" {
  statement {
    sid = "Access to ecr_repository"
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart"
    ]
    principals {
      type        = "AWS"
      identifiers = var.identifiers
    }
  }
}

resource "aws_ecr_repository_policy" "this" {
  count      = local.ecr_repository_count
  repository = aws_ecr_repository.this[count.index].name
  policy     = data.aws_iam_policy_document.this.json
}