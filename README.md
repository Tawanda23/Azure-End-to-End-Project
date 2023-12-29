# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- - [Web-App-DevOps-Project](#web-app-devops-project)
  - [Features](#features)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Usage](#usage)
  - [Technology Stack](#technology-stack)
- [Containerization Process](#containerization-process)
  - [Creating Dockerfile](#creating-dockerfile)
  - [Docker Image Build](#docker-image-build)
  - [Running the Docker Container Locally](#running-the-docker-container-locally)
  - [Tagging Docker Image](#tagging-docker-image)
  - [Pushing Docker Image to Docker Hub](#pushing-docker-image-to-docker-hub)
  - [Pulling and Running Docker Image from Docker Hub](#pulling-and-running-docker-image-from-docker-hub)
  - [Image Information](#image-information)
- [Infrastructure as Code (IaC) - Networking Module](#infrastructure-as-code-iac---networking-module)
    - [Prerequisites](#prerequisites-1)
    - [Module Structure](#module-structure)
    - [Input Variables](#input-variables)
    - [Output Variables](#output-variables)
- [Infrastructure as Code (IaC) - AKS Cluster Module](#infrastructure-as-code-iac---aks-cluster-module)
    - [Module Structure](#module-structure-1)
    - [Input Variables](#input-variables-1)
    - [Output Variables](#output-variables-1)
- [Kubernetes Deployment for Flask Web Application](#kubernetes-deployment-for-flask-web-application)
  - [Deployment and Service Manifests](#deployment-and-service-manifests)
    - [Deployment Manifest (`application-manifest.yaml`)](#deployment-manifest-application-manifestyaml)
  - [Deployment Strategy](#deployment-strategy)
  - [Testing and Validation](#testing-and-validation)
  - [Distribution Plan](#distribution-plan)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

For the application to succesfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5001`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Containerization Process

### Creating Dockerfile

- **Base Image Selection:** Chose `python:3.8-slim` 
- **Working Directory Setup:** Used `WORKDIR /app` to set the working directory inside the container to `/app`.
- **Copying Application Files:** Used `COPY app.py requirements.txt /app/` to copy application files.
- **System Dependencies and ODBC Driver Installation:** Installed necessary dependencies, ODBC driver, and updated system packages.
- **Python Packages Installation:** Used `pip install -r requirements.txt` to install all the required Python packages.
- **Port Exposure:** Exposed port 5001 using `EXPOSE 5001`.
- **Startup Command:** Set the startup command as `CMD ["python", "app.py"]` to run the Flask application.

### Docker Image Build
```bash
docker build -t my-flask-app:1.0 .
```
### Running the Docker Container Locally
```bash
docker run -p 5001:5000 my-flask-app
```
### Tagging Docker Image
```bash
docker tag my-flask-app yourusername/my-flask-app:1.0
```
### Pushing Docker Image to Docker Hub
```bash
docker push yourusername/my-flask-app:1.0
```
### Pulling and Running Docker Image from Docker Hub
```bash
docker pull yourusername/my-flask-app:1.0
docker run -p 5001:5000 yourusername/my-flask-app:1.0
```
### Image Information
**Docker Image Name:** yourusername/my-flask-app

Tags: 1.0

Docker Hub Repository: 

**Instructions for Use:**

- Pull the image: **docker pull yourusername/my-flask-app:1.0**
- Run the container: **docker run -p** `5001:5000` **yourusername/my-flask-app:1.0**
- Application can be accessed at http://127.0.0.1:5001

This documentation provides a detailed guide on the containerization process, Docker commands, and essential information about the Docker image. Commands and information can be adjusted inline with your specific project details.


##  Infrastructure as Code (IaC) - Networking Module

### Prerequisites
Before prioceeding to use this module, ensure that you have the following:

1. Azure CLI installed.
2. Azure subscription and appropriate permissions.
3. Terraform installed.
   
### Module Structure

This module creates the following Azure resources:

- Azure Resource Group
- Virtual Network
- Subnets (Worker Node and Control Plane)
- Network Security Group (NSG)

### Input Variables
- **resource_group_name** - Azure Resource Group name
- **location** - Azure region where resources are to be provisioned
- **vnet_address_space** - Virtual Network Address Space

### Output Variables
- **resource_group_name** - Resource Group name
- **worker_node_subnet_id** - Worker Node ID
- **control_plane_subnet_id** - Control Plane ID
- **vnet_id** - Virtual Network ID 
- **aks_nsg_id** - Network Security Group ID


## Infrastructure as Code (IaC) - AKS Cluster Module

### Module Structure
This module creates the following Azure resources:

- Azure Resource Group
- Virtual Network
- Subnets (Worker Node and Control Plane)
- Network Security Group (NSG)


### Input Variables
- **aks_cluster_name** - Name of the AKS cluster.
- **cluster_location** - Azure region where the AKS cluster will be deployed.
- **dns_prefix** - DNS prefix of the cluster.
- **kubernetes_version**  - Kubernetes version for the AKS cluster.
- **service_principal_client_id** - Client ID for the service principal associated with the cluster.
- **service_principal_secret** - Client Secret for the service principal.
- **resource_group_name** - Resource Group name.
- **worker_node_subnet_id** - Worker Node Subnet ID.
- **control_plane_subnet_id** - Control Plane Subnet ID.
- **vnet_id** - Virtual Network ID.


### Output Variables
- **aks_cluster_name** - The name of the aks-cluster
- **aks_cluster_id** - The id of the aks-cluster
- **aks_kubeconfig** - The name of the kubenetes configuration


## Kubernetes Deployment for Flask Web Application
This repository contains the Kubernetes manifests and deployment scripts for deploying a Flask web application on Azure Kubernetes Service (AKS). The deployment is orchestrated using Terraform to provision the AKS cluster and Kubernetes manifests for application deployment.

### Deployment and Service Manifests

### Deployment Manifest (`application-manifest.yaml`)

The Deployment manifest (`application-manifest.yaml`) defines the key parameters for deploying the Flask web application:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: flask-app-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: flask-app
  template:
    metadata:
      labels:
        app: flask-app
    spec:
      containers:
      - name: flask-app-container
        image: <your-dockerhub-username>/flask-app:latest
        ports:
        - containerPort: 5001
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1

---

apiVersion: v1
kind: Service
metadata:
  name: flask-app-service
spec:
  selector:
    app: flask-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 5000
  type: LoadBalancer

```

### Deployment Strategy
The chosen deployment strategy is Rolling Updates. This strategy ensures seamless application updates with a controlled rollout. During updates, one pod is deployed while another becomes temporarily unavailable, maintaining high availability. This strategy aligns with our application's requirements for reliability and minimal downtime.

### Testing and Validation
After deployment, the following tests were conducted to ensure application functionality and reliability:

1. **Pod Status Check:**
    - Used kubectl get pods to verify that pods are in the "Running" state.

2. **Service Availability Check:**
    - Used kubectl get services to verify that the service is available and has an external IP.

3. **Application Access Test:**
    - Accessed the application using the external IP to ensure that the web application is reachable.

4. **Logs Inspection:**
    - Used kubectl logs <pod-name> to inspect logs from the running pods for any errors.

### Distribution Plan
**Internal Distribution:**
For the application to be accessible to internal team members without relying on port forwarding, we plan to create an Ingress resource and configure domain names. This will provide a more user-friendly access mechanism.

**External Distribution:**
For external access, we will implement secure access mechanisms, such as Ingress with TLS termination. Additionally, consider setting up Azure AD authentication for secure access.


## Contributors 

- [Tawanda Mafukidze]([https://github.com/yourusername](https://github.com/Tawanda23))
- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
