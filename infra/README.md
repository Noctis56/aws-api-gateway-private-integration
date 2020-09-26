# API Gateway private integration

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.7.0 |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| ami | The ID of the source AMI | `string` | `"ami-03668ebb7c7101c3c"` | no |
| app\_listening\_port | The listening port for the application | `string` | `"18000"` | no |
| env\_name | The name of the target environment | `string` | `"poc"` | no |
| instance\_type | The type of EC2 instance (e.g. t2.micro) | `string` | `"t2.micro"` | no |
| nlb\_private\_ip | The private IP of the NLB | `string` | `"10.0.1.15"` | no |

## Outputs

| Name | Description |
|------|-------------|
| api\_invoke\_url | The URL to invoke the API pointing to the stage |
| nlb\_dns\_name | The DNS name of the load balancer |
| security\_group\_poc\_id | The ID of the security group for POC |
| subnet\_private\_ids | The list of the private subnet IDs |
| subnet\_public\_ids | The list of the public subnet IDs |
| vpc\_id | The ID of the VPC |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
