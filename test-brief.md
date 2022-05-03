# DevOps Engineer Tech Test

This is a simple tech test asking you to write some code with a purpose to verify your learning capability and Terraform skills.
There are plenty of tutorials and examples online, and you can Google as much as you like to complete the task. 

Do get prepared on explaining what you have done, especially when third party code or tutorial code have been used.

## Overall requirement
1. Once the solution is finished, please store it in a public Git repository on GitHub (this is free to create) and share the link with us
1. The solution should be working e2e, and ideally we would expect to clone the repo and run a single command to get the results
1. Please have `README.md` in your repo with instructions on how to execute your code

Please note that GCP provide a [free trial](https://console.cloud.google.com/freetrial?_ga=2.30864826.465062206.1621110953-1562635123.1620165775) with $300 credits, this should be more than sufficient to test out your solution. 

## Task 1
Start a new Terraform working directory satisfying the following requirements
1. Provision a regional `private` K8s cluster on GKE
1. A dedicated service account should be used (instead of the default one), and the service account should be created as part of the script
1. It should be creating a `new VPC` instead of using the default one
1. Subnet should be created in the `London` region, and the cluster should use this subnet instead of the subnet automatically generated
1. Make sure CIDR ranges used by the cluster are in the `RFC1918 24-bit block`
1. Create two node-pools, one with 3 nodes without auto-scaling, another with 0 node by default with auto-scaling enabled. Allow the auto-scaling node-pool to use preemptible nodes

## Task 2
In the same Terraform working directory, add the following
1. Allow outbound internet access to the private cluster without assigning external IP addresses to it
