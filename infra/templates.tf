# User data

data "template_file" "user_data" {
  template = file("${path.module}/files/user-data.sh")
}
