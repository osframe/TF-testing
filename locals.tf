

locals {
  vpc_name = {
    Name = "${var.student_name}-01-vpc"
  }
}

locals {
  vpc_tags = {
    Name      = "${var.student_name}-01-vpc"
    Terraform = "True"
    Owner     = "${var.student_name}"
    Project   = "epam-tf-lab"
  }
}

locals {
  igw_tags = {
    Name      = "${var.student_name}-01-igw"
    Terraform = "True"
    Owner     = "${var.student_name}"
    Project   = "epam-tf-lab"
  }
}

locals {
  rt_tags = {
    Name      = "${var.student_name}-01-rt"
    Terraform = "True"
    Owner     = "${var.student_name}"
    Project   = "epam-tf-lab"
  }
}

locals {
  all_tags = {
    Terraform = "True"
    Owner     = "${var.student_name}"
    Project   = "epam-tf-lab"
  }
}