
  resource "oci_containerengine_cluster" "generated_oci_containerengine_cluster" {
	compartment_id = "${var.compartment_ocid}"
	endpoint_config {
		is_public_ip_enabled = "true"
		subnet_id = "${oci_core_subnet.kubernetes_api_endpoint_subnet.id}"
	}
	freeform_tags = {
		"OKEclusterName" = "demo"
	}
	kubernetes_version = "v1.24.1"
	name = "demo"
	options {
		admission_controller_options {
			is_pod_security_policy_enabled = "false"
		}
		persistent_volume_config {
			freeform_tags = {
				"OKEclusterName" = "demo"
			}
		}
		service_lb_config {
			freeform_tags = {
				"OKEclusterName" = "demo"
			}
		}
		service_lb_subnet_ids = ["${oci_core_subnet.service_lb_subnet.id}"]
	}
	vcn_id = "${oci_core_virtual_network.DemoVCN.id}"
}

resource "oci_containerengine_node_pool" "create_node_pool_details0" {
	cluster_id = "${oci_containerengine_cluster.generated_oci_containerengine_cluster.id}"
	compartment_id = "${var.compartment_ocid}"
	freeform_tags = {
		"OKEnodePoolName" = "pool1"
	}
	initial_node_labels {
		key = "name"
		value = "demo"
	}
	kubernetes_version = "v1.24.1"
	name = "pool1"
	node_config_details {
		freeform_tags = {
			"OKEnodePoolName" = "pool1"
		}
		placement_configs {
			availability_domain = "vJOw:EU-FRANKFURT-1-AD-1"
			subnet_id = "${oci_core_subnet.node_subnet.id}"
		}
		placement_configs {
			availability_domain = "vJOw:EU-FRANKFURT-1-AD-2"
			subnet_id = "${oci_core_subnet.node_subnet.id}"
		}
		placement_configs {
			availability_domain = "vJOw:EU-FRANKFURT-1-AD-3"
			subnet_id = "${oci_core_subnet.node_subnet.id}"
		}
		size = "2"
	}
	node_eviction_node_pool_settings {
		eviction_grace_duration = "PT60M"
	}
	node_shape = "VM.Standard.A1.Flex"
	node_shape_config {
		memory_in_gbs = "8"
		ocpus = "1"
	}
	node_source_details {
		image_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaut6utcjrp3sslyfmq4ibto6smaxvdxbftjglomis5mdpijjfjnxa"
		source_type = "IMAGE"
	}
}

