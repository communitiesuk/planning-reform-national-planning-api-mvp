data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "github_planning_mvp_access" {
  statement {
    effect = "Allow"

    actions   = [
      "ecs:DescribeClusters",
      "ecs:DeleteCluster"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "ecr:PutImageTagMutability",
      "ecr:StartImageScan",
      "ecr:ListTagsForResource",
      "ecr:UploadLayerPart",
      "ecr:BatchDeleteImage",
      "ecr:ListImages",
      "ecr:DeleteRepository",
      "ecr:CompleteLayerUpload",
      "ecr:TagResource",
      "ecr:DescribeRepositories",
      "ecr:DeleteRepositoryPolicy",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetLifecyclePolicy",
      "ecr:PutLifecyclePolicy",
      "ecr:DescribeImageScanFindings",
      "ecr:GetLifecyclePolicyPreview",
      "ecr:CreateRepository",
      "ecr:PutImageScanningConfiguration",
      "ecr:GetDownloadUrlForLayer",
      "ecr:DeleteLifecyclePolicy",
      "ecr:PutImage",
      "ecr:UntagResource",
      "ecr:SetRepositoryPolicy",
      "ecr:BatchGetImage",
      "ecr:DescribeImages",
      "ecr:StartLifecyclePolicyPreview",
      "ecr:InitiateLayerUpload",
      "ecr:GetRepositoryPolicy"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "elasticloadbalancing:CreateLoadBalancer",
      "elasticloadbalancing:DeleteLoadBalancer"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "elasticloadbalancing:ModifyTargetGroupAttributes",
      "elasticloadbalancing:AddTags",
      "elasticloadbalancing:RemoveTags",
      "elasticloadbalancing:CreateTargetGroup",
      "elasticloadbalancing:DeleteTargetGroup",
      "elasticloadbalancing:ModifyTargetGroupAttributes",
      "elasticloadbalancing:AddTags",
      "elasticloadbalancing:RemoveTags"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "elasticloadbalancing:DescribeTargetGroups",
      "elasticloadbalancing:DescribeLoadBalancers"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "lambda:CreateFunction",
      "lambda:DeleteFunction",
      "lambda:GetFunction",
      "lambda:GetFunctionConfiguration",
      "lambda:InvokeFunction"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "ssm:GetParameter",
      "ssm:PutParameter",
      "ssm:GetParametersByPath",
      "ssm:DeleteParameter"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "cloudformation:DescribeStacks",
      "cloudformation:CreateChangeSet",
      "cloudformation:DescribeChangeSet",
      "cloudformation:ExecuteChangeSet",
      "cloudformation:DeleteStack",
      "cloudformation:DeleteChangeSet"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "cloudformation:CreateStackSet",
      "cloudformation:TagResource",
      "cloudformation:DescribeStackSet",
      "cloudformation:UpdateStackSet",
      "cloudformation:DescribeStackSetOperation",
      "cloudformation:ListStackInstances",
      "cloudformation:DeleteStackSet",
      "cloudformation:CreateStackInstances",
      "cloudformation:DeleteStackInstances"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "iam:GetRole",
      "iam:CreateRole",
      "iam:PutRolePolicy",
      "iam:DeleteRolePolicy",
      "iam:DeleteRole",
      "iam:PassRole",
      "iam:getRolePolicy",
      "iam:TagRole",
      "iam:UntagRole"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "servicediscovery:DeleteNamespace",
      "servicediscovery:GetNamespace"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "servicediscovery:CreatePrivateDnsNamespace",
      "servicediscovery:TagResource",
      "servicediscovery:UntagResource",
      "servicediscovery:GetOperation",
      "servicediscovery:ListNamespaces"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "route53:CreateHostedZone",
      "route53:GetHostedZone",
      "route53:DeleteHostedZone"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "ec2:CreateNatGateway",
      "ec2:CreateSecurityGroup",
      "ec2:CreateInternetGateway",
      "ec2:CreateVpc",
      "ec2:DeleteInternetGateway",
      "ec2:DeleteVpc",
      "ec2:DeleteNatGateway",
      "ec2:DeleteSecurityGroup",
      "ec2:CreateRoute",
      "ec2:DeleteRoute",
      "ec2:CreateSubnet",
      "ec2:DeleteRouteTable",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupIngress"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "ec2:DeleteSubnet",
      "ec2:CreateRouteTable",
      "ec2:DescribeInternetGateways",
      "ec2:DescribeVpcs",
      "ec2:DeleteTags",
      "ec2:CreateTags",
      "ec2:ModifyVpcAttribute",
      "ec2:DescribeAvailabilityZones",
      "ec2:AttachInternetGateway",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeAccountAttributes",
      "ec2:DescribeSubnets",
      "ec2:DescribeRouteTables",
      "ec2:DetachInternetGateway",
      "ec2:ModifySubnetAttribute",
      "ec2:DisassociateRouteTable",
      "ec2:AssociateRouteTable"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
      "s3:GetBucketTagging",
      "s3:CreateBucket",
      "s3:ListBucket",
      "s3:GetBucketVersioning",
      "s3:PutBucketCORS",
      "s3:GetBucketAcl",
      "s3:DeleteBucketPolicy",
      "s3:GetBucketPolicy",
      "s3:PutEncryptionConfiguration",
      "s3:GetEncryptionConfiguration",
      "s3:PutBucketTagging",
      "s3:GetBucketCORS",
      "s3:PutBucketAcl",
      "s3:PutBucketPolicy",
      "s3:GetBucketLocation",
      "s3:DeleteBucket",
      "s3:PutBucketVersioning"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"

    actions   = [
        "s3:DeleteObjectTagging",
        "s3:PutObject",
        "s3:GetObjectAcl",
        "s3:GetObject",
        "s3:DeleteObjectVersion",
        "s3:GetObjectVersionAcl",
        "s3:GetObjectTagging",
        "s3:PutObjectTagging",
        "s3:DeleteObject",
        "s3:PutObjectAcl",
        "s3:ListAllMyBuckets"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "github_oidc" {
  statement {
    effect = "Allow"

    principals {
      type = "Federated"

      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com",
      ]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"

      values = [
        "sts.amazonaws.com"
      ]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        "repo:communitiesuk/planning-reform-national-planning-api-mvp:*"
      ]
    }
  }
}

data "aws_iam_policy" "assume_role" {
  name = "assumerole"
}

resource "aws_iam_policy" "github_planning_mvp_access" {
   name        = "github-copilot-full-access"
   description = "The combined policy containing all that a copilot deploy from github actions requires"
   policy      = data.aws_iam_policy_document.github_planning_mvp_access.json
   tags        = var.tags
}

resource "aws_iam_role" "github_planning_mvp_access_deploy" {
  name               = "GithubCopilotDeploy"
  description        = "Collection of roles to allow for Github to Initialise and Deploy Copilot applications and services"
  assume_role_policy = data.aws_iam_policy_document.github_oidc.json
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "github_planning_mvp_access" {
  role       = aws_iam_role.github_planning_mvp_access_deploy.name
  policy_arn = aws_iam_policy.github_planning_mvp_access.arn
}

resource "aws_iam_role_policy_attachment" "assume_role" {
  role       = aws_iam_role.github_planning_mvp_access_deploy.name
  policy_arn = data.aws_iam_policy.assume_role.arn
}

resource "aws_iam_role_policy_attachment" "github_planning_mvp_access_deploy_ec2_full_access" {
  role       = aws_iam_role.github_planning_mvp_access_deploy.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "github_planning_mvp_access_deploy_iam_full_access" {
  role       = aws_iam_role.github_planning_mvp_access_deploy.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_role_policy_attachment" "github_planning_mvp_access_deploy_ssm_full_access" {
  role       = aws_iam_role.github_planning_mvp_access_deploy.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_role_policy_attachment" "github_planning_mvp_access_deploy_ecr_full_access" {
  role       = aws_iam_role.github_planning_mvp_access_deploy.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_role_policy_attachment" "github_planning_mvp_access_deploy_ecs_full_access" {
  role       = aws_iam_role.github_planning_mvp_access_deploy.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_role_policy_attachment" "github_planning_mvp_access_deploy_cloudmap_full_access" {
  role       = aws_iam_role.github_planning_mvp_access_deploy.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCloudMapFullAccess"
}

resource "aws_iam_role_policy_attachment" "github_planning_mvp_access_deploy_cloudformation_full_access" {
  role       = aws_iam_role.github_planning_mvp_access_deploy.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess"
}

resource "aws_iam_role_policy_attachment" "github_planning_mvp_access_deploy_lambda_full_access" {
  role       = aws_iam_role.github_planning_mvp_access_deploy.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
}
