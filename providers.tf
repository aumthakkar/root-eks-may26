provider "aws" {
  region = "eu-north-1"

  alias = "aws"

}

data "aws_eks_cluster_auth" "my_eks_cluster" {
  name = module.eks_cluster_may26.cluster_name
}

provider "helm" {
  kubernetes = {
    host                   = module.eks_cluster_may26.cluster_endpoint
    cluster_ca_certificate = module.eks_cluster_may26.cluster_ca_certificate
    token                  = data.aws_eks_cluster_auth.my_eks_cluster.token
  }
}
