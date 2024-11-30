#.......................................... VM Instance ..........................................#

# Create new random API key to be provisioned in FortiGates.
resource "random_string" "api_key" {
  length                 = 30
  special                = false
  numeric                = true
  depends_on             = [ module.disk ]
}

/* resource "google_compute_image" "fgtvmgvnic" {
  project      = "gcp-prj-inf-networkhub-prd-1"
  name         = "fgtvmgvnic-image"
  source_image = "projects/fortigcp-project-001/global/images/fortinet-fgtondemand-743-20240208-001-w-license"

  guest_os_features {
    type       = "GVNIC"
  }
  storage_locations = ["northamerica-northeast2"]
  depends_on   = [ random_string.api_key ]
} */

module "vm" {
  for_each     = {
    for k, v in try(var.vm,{}): k => v if v.delete != true
  }
  source                 = "git::https://source.developers.google.com/p/gcp-prj-inf-automation-prd-01/r/gcp-yyz-prd-inf-cloudautomation-modules-srep-01//terraform-google-cloud-instance"
  name                   = each.key
  project_id             = each.value.project_id
  zone                   = each.value.zone
  machine_type           = each.value.machine_type
  deletion_protection    = each.value.deletion_protection
  image                  = data.google_compute_image.fgt_image.self_link
  size                   = each.value.size
  type                   = each.value.type
  tags                   = each.value.tags
  service_account_email  = each.value.service_account_email
  service_account_scopes = each.value.service_account_scopes
  labels                 = each.value.labels
  attached_disk          = each.value.attached_disk
  can_ip_forward         = each.value.can_ip_forward
  desired_status         = each.value.desired_status
  allow_stopping_for_update = each.value.allow_stopping_for_update
  /* network_interfaces     = [
    {
      subnetwork         = data.google_compute_subnetwork.subnets[0].id #"projects/hub0101/regions/northamerica-northeast1/subnetworks/public-ext-sub"
      network_ip         = data.google_compute_address.pub_ips[count.index].address
      access_config      = []
    },
    {
      subnetwork         = data.google_compute_subnetwork.subnets[1].id #"projects/hub0101/regions/northamerica-northeast1/subnetworks/private-internal-sub001"
      network_ip         = data.google_compute_address.priv_ips[count.index].address
      access_config      = []
    },
    {
      subnetwork         = data.google_compute_subnetwork.subnets[2].id #"projects/hub0101/regions/northamerica-northeast1/subnetworks/hasync-subnet"
      network_ip         = data.google_compute_address.hasync_ips[count.index].address
      access_config      = []
    },
    {
      subnetwork         = data.google_compute_subnetwork.subnets[3].id #"projects/hub0101/regions/northamerica-northeast1/subnetworks/fw-mgmt-sub001"
      network_ip         = data.google_compute_address.mgmt_ips[count.index].address
      access_config      = [
        {
          nat_ip         = data.google_compute_address.mgmt_pub_ips[count.index].address
        }
      ]
    }
  ] */
  network_interfaces     = each.value.network_interfaces
  metadata               = {
    user-data            = (each.key == "prdyzsecfgtvm01" ? local.config_active : local.config_passive )
    #license              = fileexists(var.license_files[count.index]) ? file(var.license_files[count.index]) : null
  }
  preemptible            = each.value.preemptible
  automatic_restart      = each.value.automatic_restart
  #depends_on             = [ random_string.api_key ]
  depends_on             = [ random_string.api_key ]
}