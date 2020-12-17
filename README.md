# Deploy an IBM Cloud VPC Bastion host using Schematics
In this example we will deploy a Bastion host in an IBM Cloud VPC along with some private instances, a private load balancer, and security groups to restrict traffic.

## Deploy a VPC Bastion Host using Schematics
![VPC Bastion Diagram][1]

## Steps
1. Make sure you already have an SSH key added to Gen 2 VPC > https://cloud.ibm.com/vpc-ext/compute/sshKeys > Add SSH key. Make you deploy the key in the same region you are deploying the VPC. It should default to us-south. 
2. Click [here](https://cloud.ibm.com/schematics/workspaces/create?repository=https://github.com/greyhoundforty/ibmcloud-vpc-bastion-schematics&terraform_version=terraform_v0.13) to create a new workspace with our Repository pre-populated.
3. Fill in the Resource Group and add any tags or a description and then click Create.
4. On the subsequent page fill in the [variables](https://dsc.cloud/quickshare/Shared-Image-2020-06-15-13-32-46.png) and click Save Changes. 
5. Click Generate plan. 
6. If Generate works, click Apply plan to actually deploy the VPC and resources. 

## Customizing
If you want to change the default variables you may need access to the VPC API to pull latest stock images and profiles that are valid for the region you are deploying in to. See [Customization](CUSTOMIZATION.md) for guidance. 

[1]:    images/vpc-bastion-schematics.png "Bastion Deployment diagram"


