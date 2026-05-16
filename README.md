
### Understand the High-Level Terraform Hierarchy ####

terraform-azure/
│
├── environments/
│   ├── dev/
        ├── main.tf
        ├── variables.tf
        ├── terraform.tfvars
        ├── providers.tf
        ├── versions.tf
        └── backend.tf
│   ├── test/
│   └── prod/
│
├── modules/
│   ├── resource-group/
│   ├── storage-account/
│   └── virtual-network/
│
├── global/
├── scripts/
│
├── .gitignore
├── backend.tf
├── providers.tf
├── versions.tf
└── README.md




Understand this clearly:

Folder                  	Responsibility
----------------------------------------------------------------
modules	                    Reusable infrastructure components
environments/dev	        Calls modules for DEV
environments/prod	        Calls modules for PROD
root files	                Terraform engine configuration