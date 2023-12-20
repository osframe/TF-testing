resource "random_string" "my_numbers01" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  numeric = true
}

resource "aws_iam_group" "my-iam-group" {
  name = "${var.student_name}-01-group"
  path = "/"
}

resource "aws_iam_policy" "s3_write_policy" {
  name   = "write-to-tf-lab-${random_string.my_numbers01.result}"
  policy = file("./s3_policy.json")

  tags = local.all_tags
}

resource "aws_iam_role" "my_iam_role" {
  name = "tf-lab-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = local.all_tags
}

resource "aws_iam_role_policy_attachment" "my_role_attachment" {
  policy_arn = aws_iam_policy.s3_write_policy.arn
  role       = aws_iam_role.my_iam_role.name
}

resource "aws_iam_instance_profile" "my_instance_profile" {
  name = "tf-lab-instance-profile"

  role = aws_iam_role.my_iam_role.name
}
