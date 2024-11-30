vm                                  = {
    "prdyzsecfgtvm01"               = {
        delete                      = false
        project_id                  = "gcp-prj-inf-networkhub-prd-1",
        zone                        = "northamerica-northeast2-b",
        machine_type                = "t2d-standard-8",
        deletion_protection         = false,
        size                        = 30,
        type                        = "pd-standard"
        tags                        = ["fgt", "http-server", "https-server"],
        service_account_email       = null,
        service_account_scopes      = ["userinfo-email", "compute-rw", "storage-ro", "cloud-platform"],
        labels                      = {
            "dataclass"             = "confidential",                   # Values Supported - [restricted, confidential, internal, public]
            "env"                   = "prd",                            # Values Supported - [uat, pre-prd, prd, dev, qa, stg, sandbox, poc, shared-services]
            "appname"               = "notset",                         # Example          - <application name>
            "appid"                 = "notset",                         # Example          - <Application: Number>
            "appowner"              = "varinder_singh",                 # Example          - <FirstName.LastName@rci.rogers.ca>
            "costcenter"            = "534-1101-7571",                  # Example          - <651.2245.0254>
            "canumber"              = "23cb900457",                     # Example          - <21mb700467>
            "pii"                   = "true",                           # Values Supported - [true, false]
            "compliance"            = "none",                           # Values Supported - [sox, pci, both, none]
            "sharedservices"        = "true",                           # Values Supported - [true, false]
            "triageticket"          = "notset",                         # Example          - <cloudops-4492>
            "businessunit"          = "inf",                            # Example          - [it, dig, ebu]
            "appclass"              = "important"                       # Values Supported - [vital, critical, important, productivity]
            #"expirationdate"       = "",                               # Example          - <Expiration Date in UTC 2016-06-15T00:0> - Only for POC
        },
        attached_disk               = [
            {
                source              = "prdyzsecfgtvm01-log-disk01"

            }
        ],
        can_ip_forward              = true
        desired_status              = null
        allow_stopping_for_update   = null
        network_interfaces          = [
            {
                subnetwork          = "projects/gcp-prj-inf-networkhub-prd-1/regions/northamerica-northeast2/subnetworks/gcp-vpc-prd-out-fw-1-yyz-inf-pub-tier-01"
                network_ip          = "100.64.224.2"
                nic_type            = "GVNIC"
                access_config       = []
            },
            {
                subnetwork          = "projects/gcp-prj-inf-networkhub-prd-1/regions/northamerica-northeast2/subnetworks/gcp-vpc-prd-hub-shr-1-yyz-inf-shr-cmn-prv-tier-01"
                network_ip          = "10.23.225.130"
                nic_type            = "GVNIC"
                access_config       = []
            },
            {
                subnetwork          = "projects/gcp-prj-inf-networkhub-prd-1/regions/northamerica-northeast2/subnetworks/gcp-vpc-prd-ha-fw-1-yyz-inf-prv-tier-01"
                network_ip          = "100.64.224.34"
                nic_type            = "GVNIC"
                access_config       = []
            },
            {
                subnetwork          = "projects/gcp-prj-inf-networkhub-prd-1/regions/northamerica-northeast2/subnetworks/gcp-vpc-prd-mgmt-fw-1-yyz-inf-prv-tier-01"
                network_ip          = "10.23.224.2"
                nic_type            = "GVNIC"
                access_config       = []
            }
        ]
        preemptible                 = false
        automatic_restart           = false
    },
    "prdyzsecfgtvm02"               = {
        delete                      = false
        project_id                  = "gcp-prj-inf-networkhub-prd-1",
        zone                        = "northamerica-northeast2-c",
        machine_type                = "t2d-standard-8",
        deletion_protection         = false,
        size                        = 30,
        type                        = "pd-standard"
        tags                        = ["fgt", "http-server", "https-server"],
        service_account_email       = null,
        service_account_scopes      = ["userinfo-email", "compute-rw", "storage-ro", "cloud-platform"],
        labels                      = {
            "dataclass"             = "confidential",                   # Values Supported - [restricted, confidential, internal, public]
            "env"                   = "prd",                            # Values Supported - [uat, pre-prd, prd, dev, qa, stg, sandbox, poc, shared-services]
            "appname"               = "notset",                         # Example          - <application name>
            "appid"                 = "notset",                         # Example          - <Application: Number>
            "appowner"              = "varinder_singh",                 # Example          - <FirstName.LastName@rci.rogers.ca>
            "costcenter"            = "534-1101-7571",                  # Example          - <651.2245.0254>
            "canumber"              = "23cb900457",                     # Example          - <21mb700467>
            "pii"                   = "true",                           # Values Supported - [true, false]
            "compliance"            = "none",                           # Values Supported - [sox, pci, both, none]
            "sharedservices"        = "true",                           # Values Supported - [true, false]
            "triageticket"          = "notset",                         # Example          - <cloudops-4492>
            "businessunit"          = "inf",                            # Example          - [it, dig, ebu]
            "appclass"              = "important"                       # Values Supported - [vital, critical, important, productivity]
            #"expirationdate"       = "",                               # Example          - <Expiration Date in UTC 2016-06-15T00:0> - Only for POC
        },
        attached_disk               = [
            {
                source              = "prdyzsecfgtvm02-log-disk01"

            }
        ],
        can_ip_forward              = true
        desired_status              = null
        allow_stopping_for_update   = null
        network_interfaces          = [
            {
                subnetwork          = "projects/gcp-prj-inf-networkhub-prd-1/regions/northamerica-northeast2/subnetworks/gcp-vpc-prd-out-fw-1-yyz-inf-pub-tier-01"
                network_ip          = "100.64.224.3"
                nic_type            = "GVNIC"
                access_config       = []
            },
            {
                subnetwork          = "projects/gcp-prj-inf-networkhub-prd-1/regions/northamerica-northeast2/subnetworks/gcp-vpc-prd-hub-shr-1-yyz-inf-shr-cmn-prv-tier-01"
                network_ip          = "10.23.225.131"
                nic_type            = "GVNIC"
                access_config       = []
            },
            {
                subnetwork          = "projects/gcp-prj-inf-networkhub-prd-1/regions/northamerica-northeast2/subnetworks/gcp-vpc-prd-ha-fw-1-yyz-inf-prv-tier-01"
                network_ip          = "100.64.224.35"
                nic_type            = "GVNIC"
                access_config       = []
            },
            {
                subnetwork          = "projects/gcp-prj-inf-networkhub-prd-1/regions/northamerica-northeast2/subnetworks/gcp-vpc-prd-mgmt-fw-1-yyz-inf-prv-tier-01"
                network_ip          = "10.23.224.3"
                nic_type            = "GVNIC"
                access_config       = []
            }
        ]
        preemptible                 = false
        automatic_restart           = false
    }
}