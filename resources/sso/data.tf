data "aws_ssoadmin_instances" "instance" {}

data "aws_identitystore_group" "group" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.instance.identity_store_ids)[0]

  filter {
    attribute_path  = "DisplayName"
    attribute_value = var.group_name
  }
}
