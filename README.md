# Terraform module for creating ECR repositories

## Prerequisites

- Terraform 0.12.x
- aws cli

## Available features

- Create ECR repo
- adding life cycle hooks based on tags/dangling images and count

## Usage
**From Github**
```hcl
module "ecr" {
  source  = "../"
    repository_names = ["example1","example2"]
    org_unit = "example"
    image_tag_mutability = "MUTABLE"
    scan_on_push = true
    max_untagged_image_count = 3
    max_tagged_image_count = 30
    identifiers = ["123454321"]
    additional_tags = var.additional_tags

}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.24 |
| aws | ~> 2.60 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.60 |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| identifiers | (Required) List of identifiers for principals. these are IAM user or role ARNs. | `list` | `[]` | no |
| image\_tag\_mutability | The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE | `string` | `"IMMUTABLE"` | no |
| max\_tagged\_image\_count | The maximum number of tagged images that you want to retain in repository. | `number` | `60` | no |
| max\_untagged\_image\_count | The maximum number of untagged images that you want to retain in repository. | `number` | `3` | no |
| org\_unit | Name of the Project/Org unit | `string` | `"example"` | no |
| repository\_names | Name of the repositories | `list` | <pre>[<br>  "example1",<br>  "example2"<br>]</pre> | no |
| scan\_on\_push | Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false). | `bool` | `true` | no |
| tags | n/a | `map(string)` | <pre>{<br>  "Managed By": "Terraform"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Full ARN of the repository |
| registry\_id | The registry ID where the repository was created. |
| repository\_url | The URL of the repository (in the form aws\_account\_id.dkr.ecr.region.amazonaws.com/repositoryName |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
- [ ] Moving tagPrefixList to variables
