module "eks_cluster_may26" {
  source = "git::https://github.com/aumthakkar/eks-may26.git"

  aws_region  = "eu-north-1"
  name_prefix = "pht-dev"
  vpc_cidr    = "10.100.0.0/16"

  public_subnets_count  = 2
  private_subnets_count = 2

  eks_version                 = "1.33"
  eks_endpoint_private_access = true
  eks_endpoint_public_access  = true

  eks_cluster_public_access_cidrs = ["5.71.198.252/32"]
  k8s_service_ipv4_cidr           = "172.20.0.0/16"

  k8s_enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

 
  node_group_ami_type       = "AL2023_ARM_64_STANDARD"
  node_group_instance_types = ["t4g.medium"]

  node_group_capacity_type = "ON_DEMAND"
  node_group_disk_size     = 20

  create_ebs_csi_driver       = true
  create_cw_obs_driver        = true
  create_lb_controller_driver = true
  create_efs_csi_driver       = true
}