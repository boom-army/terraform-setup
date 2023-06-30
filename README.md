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

## Hosted zone

- `aws route53 list-hosted-zones`
- `aws route53 get-hosted-zone --id /hostedzone/Z06423431W0J94NA4YSWV`

```
{
    "HostedZone": {
        "Id": "/hostedzone/Z06423431W0J94NA4YSWV",
        "Name": "boom.army.",
        "CallerReference": "terraform-20230629231157835000000001",
        "Config": {
            "Comment": "Managed by Terraform",
            "PrivateZone": false
        },
        "ResourceRecordSetCount": 10
    },
    "DelegationSet": {
        "NameServers": [
            "ns-1466.awsdns-55.org",
            "ns-685.awsdns-21.net",
            "ns-363.awsdns-45.com",
            "ns-1961.awsdns-53.co.uk"
        ]
    }
}
```