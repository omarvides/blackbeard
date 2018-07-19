provider "google" {
  credentials = "${file("./credentials.json")}"
  project = "terraform-blackbeard"
}

resource "google_container_cluster" "production" {
  name               = "blackbeard"
  zone               = "${var.main_zone}"
  initial_node_count = 1

  additional_zones = ["${var.additional_zones}"]

  master_auth {
    password = "${var.master_user}"
    username = "${var.master_pass}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
