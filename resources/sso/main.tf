resource "aws_ssoadmin_permission_set" "ps" {
  name             = var.ps_name
  instance_arn     = tolist(data.aws_ssoadmin_instances.instance.arns)[0]
  description      = var.description
  session_duration = var.session_duration
  tags             = var.tags
}

resource "aws_ssoadmin_permission_set_inline_policy" "inline_policy" {
  count              = var.inline_policy != null ? 1 : 0
  instance_arn       = aws_ssoadmin_permission_set.ps.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.ps.arn
  inline_policy      = file(var.inline_policy)
}

resource "aws_ssoadmin_managed_policy_attachment" "aws_policy" {
  for_each           = toset(var.aws_policies)
  instance_arn       = aws_ssoadmin_permission_set.ps.instance_arn
  managed_policy_arn = each.key
  permission_set_arn = aws_ssoadmin_permission_set.ps.arn
}

resource "aws_ssoadmin_account_assignment" "account" {
  instance_arn       = aws_ssoadmin_permission_set.ps.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.ps.arn

  principal_id   = data.aws_identitystore_group.group.group_id
  principal_type = "GROUP"

  target_id   = var.account_id
  target_type = "AWS_ACCOUNT"
}
