variable "name" {
  default = "attacker"
}

variable "image_id" {
    default = "m-k1a9u984xy2la0ii6ej8"
}


resource "alicloud_instance" "instance" {
  count = 3

  availability_zone = data.alicloud_zones.default.zones.0.id
  security_groups   = ["${data.alicloud_security_groups.default.groups.0.id}"]

  instance_type              = "ecs.g6.xlarge"
  system_disk_category       = "cloud_efficiency"
  image_id                   = var.image_id
  instance_name              = "${var.name}-${count.index + 1}"
  vswitch_id                 = "${data.alicloud_vswitches.default.vswitches.0.id}"
  internet_charge_type = "PayByTraffic"
  spot_strategy = "SpotAsPriceGo"
  key_name = "admin"
  internet_max_bandwidth_out = 100

  user_data = "${file("attack.sh")}"
}