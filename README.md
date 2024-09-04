# DevOps Task 1 - Main Branch
## Overview

This project demonstrates a complete DevOps pipeline from setting up a local development environment to deploying a Dockerized application on AWS. The main branch includes all the necessary files and instructions to run the application locally and push the code to a GitHub repository.
Project Structure

  Clone the Repository
        Connect to GitHub using SSH keys.
        Clone the repository using the following command:

  git clone git@github.com:KarimElAraby/DevOps-task-1.git

Running the Application Locally from devleopment branch

  Follow the instructions in the README file to set up and run the application.
  Run tests and then start the server.
  Access the application at http://localhost:5000 to see the "Hello, Botit!" message.

Dockerization

The project includes Dockerization of the server:

  Create a .dockerignore file to reduce the image size.
    Build and tag the Docker image:
        docker build -t karimaraby/botit-task-src:3.0 .

   Push the image to DockerHub:
     docker push karimaraby/botit-task-src:3.0

Run the Docker container with port mapping and volume for log storage:

  docker run -p 5000:5000 -v ~/hello-data:/var/log karimaraby/botit-task-src:3.0

Cloud Deployment

  Set up AWS resources including a VPC, subnets, an internet gateway, route tables, and an EC2 instance to host the application.
  Run the Dockerized application on the EC2 instance and access it via the public IP.

CI/CD with Jenkins

  Run Jenkins as a Docker container on the same EC2 instance.
  Set up a Jenkins pipeline to automate the build, test, and deployment process.
  Configure GitHub webhooks to trigger the pipeline on code changes.
