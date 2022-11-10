/*
  resource "oci_containerengine_cluster" "generated_oci_containerengine_cluster" {
	compartment_id = "ocid1.compartment.oc1..aaaaaaaamd3hih6cimdf45osxhiz3parxgyki4uk4a2ai6kdpczjejrbn3oa"
	endpoint_config {
		is_public_ip_enabled = "true"
		subnet_id = "${oci_core_subnet.kubernetes_api_endpoint_subnet.id}"
	}
	freeform_tags = {
		"OKEclusterName" = "cluster2"
	}
	kubernetes_version = "v1.24.1"
	name = "cluster2"
	options {
		admission_controller_options {
			is_pod_security_policy_enabled = "false"
		}
		persistent_volume_config {
			freeform_tags = {
				"OKEclusterName" = "cluster2"
			}
		}
		service_lb_config {
			freeform_tags = {
				"OKEclusterName" = "cluster2"
			}
		}
		service_lb_subnet_ids = ["${oci_core_subnet.service_lb_subnet.id}"]
	}
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_containerengine_node_pool" "create_node_pool_details0" {
	cluster_id = "${oci_containerengine_cluster.generated_oci_containerengine_cluster.id}"
	compartment_id = "ocid1.compartment.oc1..aaaaaaaamd3hih6cimdf45osxhiz3parxgyki4uk4a2ai6kdpczjejrbn3oa"
	freeform_tags = {
		"OKEnodePoolName" = "pool1"
	}
	initial_node_labels {
		key = "name"
		value = "cluster2"
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
		size = "3"
	}
	node_eviction_node_pool_settings {
		eviction_grace_duration = "PT60M"
	}
	node_shape = "VM.Standard.E3.Flex"
	node_shape_config {
		memory_in_gbs = "16"
		ocpus = "1"
	}
	node_source_details {
		image_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaa6bjmlse5m66ynvzdayahqwsn73fug6lh5gjxkcmabivvpzegdpa"
		source_type = "IMAGE"
	}
}
*/
