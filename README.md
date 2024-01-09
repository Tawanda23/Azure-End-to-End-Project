# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones. 

## Table of Contents

- - [Web-App-DevOps-Project](#web-app-devops-project)
  - [Features](#features)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Usage](#usage)
  - [Technology Stack](#technology-stack)
- [Delivery Date Tracking](#delivery-date-tracking)
    - [Key Components](#key-components)
    - [How It Works](#how-it-works)
    - [Integration Steps](#integration-steps)
    - [Reverting the Feature](#reverting-the-feature)
    - [Future Development](#future-development)
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

## Delivery Date Tracking

The Delivery Date Tracking feature provides a mechanism for tracking delivery dates in the company's internal application. Although the feature has been temporarily reverted, this documentation will serve as a guide for developers who may need to reintegrate the feature in the future and for end-users who would benefit from its functionality.

The Delivery Date Tracking feature improves the application by allowing users to associate delivery dates with specific records.

### Key Components

- **Delivery Date Column:** A database column (`delivery_date`) was added to the backend Azure SQL Database to store delivery dates.

### How It Works

The feature operates by adding a new column to the database schema, allowing users to input and retrieve delivery dates for relevant records.

### Integration Steps

If you plan to reintegrate the feature in the future, follow these steps:

1. **Branching:**
   - Create a new branch for feature development based on the `main` branch.
   - Make changes to the code base to accommodate the feature.

2. **Database Update:**
   - Ensure that the `delivery_date` column is added to the backend Azure SQL Database with the appropriate data type.

3. **Code Modifications:**
   - Integrate code changes to handle the new feature.
   - Update any relevant documentation to reflect the changes made.

4. **Testing:**
   - Thoroughly test the feature to ensure proper functionality.

5. **Documentation:**
   - Update or create documentation to reflect the changes made and guide users and developers on using the feature.

6. **Pull Request:**
   - Create a pull request for the new feature branch, ensuring that the changes are reviewed and approved.

7. **Merge:**
   - After approval, merge the feature branch into the `main` branch.


## Usage Guide for End-Users

### Adding Delivery Dates

To add a delivery date to a record:

1. Navigate to the relevant section of the application.
2. Locate the record for which you want to add a delivery date.
3. Edit the record and find the "Delivery Date" field.
4. Input the desired delivery date.
5. Save the changes.

### Retrieving Delivery Dates

To view delivery dates associated with records:

1. Access the record or report section.
2. Look for the "Delivery Date" field in the record details.

### Considerations

- The `delivery_date` column was designed to store date values.
- Ensure that relevant validations are in place to handle date inputs appropriately.

### Reverting the Feature

If there's a need to revert the feature:

1. Follow the steps outlined
markdown
Copy code
in the [Revert Section](#reverting-the-feature) of this documentation.
2. Communicate the revert to the team, ensuring everyone is aware of the changes.

### Future Development

While the feature has been reverted for now, there might be future scenarios where it becomes relevant again. Keep the documentation up-to-date, and consider incorporating user feedback for improvements.

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
For the application to be accessible to internal team members without the reliance on port forwarding, the plan is to create an Ingress resource and configure domain names. This will provide a more user-friendly access mechanism.

**External Distribution:**
For external access, we will implement secure access mechanisms, such as Ingress with TLS termination. Additionally, consider setting up Azure AD authentication for secure access.


## Continuous Integration and Continuous Deployment (CI/CD) Pipeline

This section provides a comprehensive informative detail about the Azure CI/CD pipeline used for building, testing, and deploying the application in Azure DevOps.

## CI/CD Pipeline Configuration

### Source Repository

The source code for this project is hosted on [GitHub](https://github.com/Tawanda23/DevOps-Project.git). The main branch is configured as the trigger for the Azure CI/CD pipeline.

### Build Pipeline

The build pipeline is defined in the `application-manifest.yaml` file. It includes the following configurations:

- **Trigger:** The pipeline is triggered on commits to the main branch.
- **Pool:** The build is executed on an Ubuntu latest VM image.
- **Steps:**
  - Docker Build: Builds the Docker image using the specified Dockerfile.
  - Publish Build Artifacts: Publishes the Docker image as a build artifact.

### Release Pipeline

The release pipeline is defined in the Azure DevOps portal. It will include the following configurations:

- **Artifact:** The artifact is sourced from the build pipeline.
- **Stages:**
  - **Dev Environment:**
    - Docker Registry Connection: Configured to use Docker Hub.
    - Kubernetes Service Connection: Configured to use the AKS DevOps service connection.
    - Deploy to Kubernetes Task: Deploys the application to the AKS cluster.


### Docker Hub Integration

The Docker image is pushed to [Docker Hub](https://hub.docker.com/tawanda23/my-app:1.0-slim) as part of the build process.

### AKS Integration

The application will be deployed to an Azure Kubernetes Service (AKS) cluster. AKS DevOps service connection will be used for authentication.

## Validation Steps

To check the validity and the functionality of the CI/CD pipeline, the following steps were performed:

1. **Monitoring Pod Status:**
   - Executed `kubectl get pods -n <your-namespace>` to ensure pods are in the "Running".

2. **Port Forwarding:**
   - Used `kubectl port-forward` to forward a local port to a pod for testing purposes.

3. **Testing Application Functionality:**
   - Accessed the application at the locally exposed address (e.g., http://localhost:5001).
   - Tested various functionalities to ensure proper operation.

4. **Cleanup:**
   - Stopped port forwarding using `Ctrl + C` when testing was complete.

### Issues Encountered

- Encountered issues with connecting to the host network. This was rectified by ensuring the yaml file was correctly configured

### Contributing

If you encounter any issues or have suggestions for improvement, please open an issue or submit a pull request.

## AKS Cluster Monitoring 

### Metrics Explorer Charts

1. **Average Node CPU Usage Percentage per Minute:**
   - **Metric:** `KubeNodeCpuUsageCoreNanoSeconds`
   - **Aggregation:** `Average`
   - **Significance:** Monitors the average CPU usage across AKS nodes. High values may indicate resource contention.

2. **Average Node Memory Usage Percentage per Minute:**
   - **Metric:** `KubeNodeMemoryWorkingSetBytes`
   - **Aggregation:** `Average`
   - **Significance:** Monitors average memory working set across AKS nodes. High values suggest increased memory consumption.

3. **Used Disk Percentage:**
   - **Metric:** `KubeNodeFilesystemUsagePercent`
   - **Aggregation:** `Average`
   - **Significance:** Monitors the percentage of used disk space on nodes.

4. **Bytes Read and Written per Second:**
   - **Metric:** `KubeNodeDiskIo`
   - **Aggregation:** `Sum`
   - **Significance:** Monitors data I/O rates on nodes.

### Log Analytics Logs

1. **Average Node CPU Usage Logs:**
   - **Query:**
     ```kql
     Perf | where ObjectName == "K8SNode" and CounterName == "cpuUsageNanoCores" | summarize AvgCpuUsagePercentage = avg(CounterValue / 10000000) by bin(TimeGenerated, 1m)
     ```
   - **Significance:** Provides historical CPU usage data for all nodes.

2. **Average Node Memory Usage Logs:**
   - **Query:**
     ```kql
     Perf | where ObjectName == "K8SNode" and CounterName == "memoryRssBytes" | summarize AvgMemoryUsagePercentage = avg(CounterValue / 1024 / 1024 / 1024 * 100) by bin(TimeGenerated, 1m)
     ```
   - **Significance:** Provides historical memory usage data for the nodes.

3. **Used Disk Percentage Logs:**
   - **Query:**
     ```kql
     Perf | where ObjectName == "K8SNode" and CounterName == "filesystemUsagePercent" | summarize AvgDiskUsagePercentage = avg(CounterValue) by bin(TimeGenerated, 1m)
     ```
   - **Significance:** Provides historical disk usage data for nodes.

4. **Bytes Read and Written Logs:**
   - **Query:**
     ```kql
     Perf | where ObjectName == "K8SNode" and CounterName == "diskIo"
     ```
   - **Significance:** Provides historical data I/O metrics for nodes.

### Alarm Configurations

1. **CPU Usage Alarm:**
   - **Condition:** Greater than 80%
   - **Period:** 5 minutes
   - **Loopback Period:** 15 minutes
   - **Action:** Email notification

2. **Memory Usage Alarm:**
   - **Condition:** Greater than 80%
   - **Period:** 5 minutes
   - **Loopback Period:** 15 minutes
   - **Action:** Email notification

3. **Disk Usage Alarm:**
   - **Condition:** Greater than 90%
   - **Period:** 5 minutes
   - **Loopback Period:** 15 minutes
   - **Action:** Email notification

### Response Strategies

1. **CPU/Memory Alerts:**
   - **Scale Resources:** Increase node capacity or consider horizontal scaling.
   - **Optimize Workloads:** Review and optimize resource-intensive workloads.
   - **Troubleshoot:** Investigate specific pods causing high memory usage.

2. **Disk Usage Alerts:**
   - **Scale Resources:** Add more nodes to the cluster.
   - **Cleanup Unused Data:** Delete unnecessary files or containers.
   - **Review Storage Configuration:** Storage settings optimisation.

3. **I/O Metrics Alerts:**
   - **Review Workload:** Identify and optimize data-intensive processes.
   - **Scale Storage:** Consider increasing storage capacity.
   - **Review Disk Performance:** Investigate the possibility of certain disks causing bottlenecks.

4. **Email Notifications:**
   - **Immediate Investigation:** Respond promptly to emails indicating alerts.
   - **Review Metrics and Logs:** Analyze Metrics Explorer charts and Log Analytics logs for detailed insights.
   - **Implement Fixes:** If issues have been identified, apply the necessary fixes based on the identified issues.


## Contributors 
- [Tawanda Mafukidze]([https://github.com/yourusername](https://github.com/Tawanda23))
- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License
This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
