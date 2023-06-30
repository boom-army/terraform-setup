# Sosol terraform infr

Infrastructure for sosol aws using terraform.

## Useful commands

- terraform fmt | Format your configuration
- terraform validate | Validate your configuration
- terraform plan | Show the infr changes output
- terraform apply | Apply the configuration
- terraform apply -var-file=".tfvars" | Apply the configuration
- terraform show | show state of running infr
- terraform state list | overview of state
- terraform destroy | destroy infr


## Prod commands

- terraform init
- terraform apply -var-file='.tfvars'
- terraform plan -var-file='.tfvars'