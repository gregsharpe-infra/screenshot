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

resource aws_iam_user screenshot {
  name = "screenshot-uploader"
}

resource aws_iam_user_policy_attachment screenshot {
  user       = aws_iam_user.screenshot.name
  policy_arn = aws_iam_policy.screenshot.arn
}
