module "bastion_subnet_gateway" {
    source "./public_gateway"
    resource_group_id = data.ibm_resource_group.default.id
    vpc_id = data.ibm_is_vpc.vpc.id
}

module "bastion_subnet" {
    source "./subnets"
        resource_group_id = data.ibm_resource_group.default.id
    vpc_id = data.ibm_is_vpc.vpc.id
}

module "bastion_security_group" {
    source "./security"
        resource_group_id = data.ibm_resource_group.default.id
    vpc_id = data.ibm_is_vpc.vpc.id
}

module "private_subnet" {
    source "./subnets"
    resource_group_id = data.ibm_resource_group.default.id
    vpc_id = data.ibm_is_vpc.vpc.id
}

module "private_security_group" {
    source "./security"
    resource_group_id = data.ibm_resource_group.default.id
    vpc_id = data.ibm_is_vpc.vpc.id

}

module "bastion_instance" {
    source "./instance"
    resource_group_id = data.ibm_resource_group.default.id
    vpc_id = data.ibm_is_vpc.vpc.id
    name = "bastion"
}

module "private_instance" {
    source "./instance"
    resource_group_id = data.ibm_resource_group.default.id
    vpc_id = data.ibm_is_vpc.vpc.id
    name = "private"
}