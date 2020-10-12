resource aws_iam_user screenshot {
  name = "screenshot-uploader"
}

data aws_iam_policy_document assume_role {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource aws_iam_role screenshot {
  name               = "screenshot-uploader"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource aws_iam_policy screenshot {
  name        = "screenshot-uploader"
  description = "screenshot.gregsharpe.co.uk application user permissions"

  policy = data.aws_iam_policy_document.screenshot.json
}

data aws_iam_policy_document screenshot {
  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetObject"
    ]
    resources = [
      module.screenshot.s3_bucket_arn,
      "${module.screenshot.s3_bucket_arn}/*"
    ]
  }
}

resource aws_iam_role_policy_attachment screenshot {
  role       = aws_iam_role.screenshot.name
  policy_arn = aws_iam_policy.screenshot.arn
}
