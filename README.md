# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
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

User
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


## Contributors 

- [Tawanda Mafukidze]([https://github.com/yourusername](https://github.com/Tawanda23))
- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
