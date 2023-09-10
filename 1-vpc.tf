
data "alicloud_zones" "default" {}

data "alicloud_vpcs" "vpc" {
	vpc_name = "${var.vpc_name}"

}

data "alicloud_vswitches" "default" {
  name_regex = "^ecs$"
}

data "alicloud_security_groups" "default" {
  vpc_id = "${data.alicloud_vpcs.vpc.vpcs.0.id}"
}