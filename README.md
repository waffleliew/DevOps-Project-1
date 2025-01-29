# DevOps-Project-1: Automated EC2 Instance Provisioning with Terraform, Ansible, and Jenkins

## Overview
This project automates the provisioning of AWS EC2 instances using Terraform, configures them with Ansible, and orchestrates the workflow using Jenkins. It provides a fully automated CI/CD pipeline for deploying infrastructure and configuring servers efficiently.

## Technologies Used
- **Terraform**: Infrastructure as Code (IaC) for provisioning AWS EC2 instances.
- **Ansible**: Configuration management and software provisioning.
- **Jenkins**: CI/CD automation to orchestrate the provisioning process.
- **AWS**: Cloud service provider for hosting EC2 instances.

## Features
- Automates EC2 instance provisioning using Terraform.
- Configures instances with Ansible for software installation and setup.
- Uses Jenkins pipelines to automate the entire deployment process.
- Securely manages AWS credentials and configurations.
- Scalable and reusable infrastructure code.

## Prerequisites
Before you begin, ensure you have:
- An AWS account with permissions to create EC2 instances, S3 buckets, and IAM roles.
- A Jenkins server setup with the necessary plugins installed (Terraform, Ansible, Rebuild plugin).
- Basic familiarity with Terraform, Ansible, and Jenkins pipelines.

## Setup Instructions

### 1. Setting Up Jenkins Parameters and Variables
To make the pipeline flexible, you'll need to define parameters in Jenkins:
- **Choice Parameter for Terraform Actions**: Define whether the pipeline will run `apply` (to provision resources) or `destroy` (to tear down resources).
- **String Parameter for Server Name**: Allow for the specification of the server name (e.g., Apache ).

#### Steps in Jenkins:
1. Go to **Manage Jenkins > Configure System** and create two parameters:
   - A **Choice Parameter** named `terraform_action` with options `apply` and `destroy`.
   - A **String Parameter** called `server_name` for specifying server names.

### 2. Running Terraform to Provision Infrastructure
With the parameters set, trigger the pipeline with the `apply` action to provision your EC2 instance. Make sure the instance configuration in Terraform is correct, and check your AWS account to confirm the instance is created successfully.

### 3. Assigning IAM Role to Jenkins EC2 Instance
For Jenkins to interact with AWS resources, ensure the Jenkins EC2 instance has an IAM role attached with the necessary permissions. The role should allow Jenkins to create EC2 instances and manage other AWS resources like S3.

#### Steps:
1. Attach the IAM Role to the Jenkins EC2 instance.
2. This step ensures that Jenkins has the permissions to interact with AWS services.

### 4. Setting Up S3 Bucket for Terraform State
Terraform uses S3 for state file storage. Follow these steps to set it up:
1. **Create an S3 Bucket**: This bucket will store the Terraform state files.
2. **Configure Terraform Backend**: Update your Terraform configuration to use this S3 bucket for state storage. This ensures that Terraform state is preserved and accessible.

### 5. Installing Necessary Jenkins Plugins
To trigger the pipeline with the same parameters, install the **Rebuild Plugin**:
1. Go to **Manage Jenkins > Manage Plugins > Available**, search for "Rebuild," and install it.

### 6. Running Terraform Apply and Plan
Once everything is set up, trigger the pipeline and choose `apply` to provision the EC2 instance. You can verify the instance creation by checking the EC2 console in AWS.

### 7. Troubleshooting Terraform Issues
If you encounter issues during the Terraform run:
- Double-check AWS credentials and ensure the IAM role is properly attached.
- Ensure the S3 bucket is correctly created and configured for state management.
- Verify that Jenkins has the necessary permissions to interact with AWS resources.

### 8. Using Ansible for EC2 Configuration
Once your EC2 instance is provisioned, you can use Ansible to configure it (e.g., installing Apache, Nginx, or other applications):
1. Install Ansible on your Jenkins server.
2. Set up AWS EC2 dynamic inventory: This allows Ansible to automatically discover your EC2 instances based on tags or other attributes.

### 9. Configuring Ansible Playbook for Application Installation
In the next step, you can configure your EC2 instances with an Ansible playbook. For example, the playbook could install Apache and ensure the service is running on the instance. You'll also need to configure Ansible to access the EC2 instances by setting up SSH keys correctly and ensuring the dynamic inventory is working.

### 10. Handling Ansible Errors
If Ansible encounters issues connecting to your EC2 instance (such as host verification failures), ensure you disable SSH host key checking in Ansible's configuration or add the EC2 instance's SSH key to your trusted hosts.

### 11. Running the Full Pipeline
With everything set up, run the full Jenkins pipeline:
1. Trigger the pipeline with the `apply` option to provision the EC2 instance.
2. Ansible will automatically run and configure the instance (installing Apache, etc.).
3. Once everything is complete, verify the application (e.g., Apache) is working on the EC2 instance.

## Future Enhancements ⭐
- Integrate monitoring with Prometheus & Grafana.
- Add auto-scaling and load balancing.
- Implement AWS Lambda for event-driven automation.




