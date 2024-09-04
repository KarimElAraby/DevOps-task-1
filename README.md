# DevOps Task 1 - Deployment Branch
## Overview

This branch includes additional deployment tasks and enhancements such as Docker Compose setup, Kubernetes deployment, and monitoring using various tools.
Bonus Tasks

   Docker Compose
        A docker-compose.yml file is provided to run multiple containers with shared volumes and networks.
        The setup allows for changes in the source code to be reflected within the container environment seamlessly.

  Kubernetes (K8s) Deployment
        A KinD cluster is used to deploy the application using a deployment.yaml file.
        The deployment manages two replica sets, each running a container from the Docker image.
        An Ingress controller is set up to expose the application externally.

  Terraform for Infrastructure as Code (IAC)
        Terraform scripts are provided to automate the provisioning of AWS infrastructure.
        The setup includes VPC, subnets, security groups, EC2 instances, and more.

  Monitoring and Logging
        Implemented monitoring using AWS CloudWatch and a shell script for resource utilization alerts.
        Prometheus is used for collecting metrics, and Grafana for visualizing the service health.
