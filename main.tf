resource "google_bigtable_instance_iam_binding" "bigtable_instance_iam_bindings" {
  for_each = var.bigtable_instance_iam_bindings

  instance = each.value.instance
  members  = each.value.members
  role     = each.value.role
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

