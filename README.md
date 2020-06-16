# Deploy an IBM Cloud VPC Bastion host using Schematics
In this example we will deploy a Bastion host in an IBM Cloud VPC along with some private instances, a private load balancer, and security groups to restrict traffic.

## Deploy a VPC Bastion Host using Schematics
![VPC Bastion Diagram][1]

## Steps
1. Make sure you already have an SSH key added to Gen 2 VPC > https://cloud.ibm.com/vpc-ext/compute/sshKeys > Add SSH key. Make you deploy the key in the same region you are deploying the VPC. It should default to us-south. 
2. Create a new [Schematics Workspace](https://cloud.ibm.com/schematics/workspaces/create). 
3. After the Workspace is created, you will be prompted to provide your **Terraform template Repository** `https://github.com/greyhoundforty/ibmcloud-vpc-bastion-schematics.git` and **Terraform Version** `terraform_v0.12`. Click Save Template information. 
4. On the subsequent page fill in the [variables](https://dsc.cloud/quickshare/Shared-Image-2020-06-15-13-32-46.png) and click Save Changes. 
5. Click Generate plan. 
6. If Generate works, click Apply plan to actually deploy the VPC and resources. 

## Customizing
If you want to change the default variables you may need access to the VPC API to pull latest stock images and profiles that are valid for the region you are deploying in to. See [Customization](CUSTOMIZATION.md) for guidance. 

[1]:    images/vpc-bastion-schematics.png "Bastion Deployment diagram"


