# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)


## Architecture of The Project

![image](https://i.imgur.com/hupYr7m.png)

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
- azure-identity (version 1.15.0)
- azure-keyvault-secrets (version 4.7.0)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Delivery Date

### **Making Changes in the Main Branch**

The introduction of a delivery date column into the `app.py` and `orders.html` files within the main branch involved the creation and merging of branches. Specifically, branches from `feature/add-delivery-date` were created and merged into main. Utilizing Visual Studio Code and Git Bash, modifications were made within the `feature/add-delivery-date` branch to include the delivery date in both files. After making changes, the standard Git workflow was followed: using `git add .` to stage the changes, `git commit -m "message"` to commit to the local repository, and `git push --set-upstream origin feature/add-delivery-date` to set up the branch in the remote repository. A subsequent `git push` finalized the process. A pull request from `feature/add-delivery-date` into main facilitated the review and eventual merge of the two branches.

### **Reverting Changes**

In a scenario where the changes were unnecessary, a reversion process was initiated. This involved using `git pull` to fetch the contents of the remote repository, followed by the creation of a feature branch (revert-delivery-date) from the main branch. After switching into the new branch with `git checkout revert-delivery-date`, the `git log` command helped identify the appropriate commit before the changes were merged into main. The `git revert {number-of-revert}` command was then used to revert the changes. Following this, `git add .`, `git commit -m "message"`, and `git push --set-upstream origin revert-delivery-date` were executed to finalize the branch creation and push the changes to the remote repository. A pull request was made, changes were reviewed, and the two branches were merged. Checking out the main branch confirmed the successful reversion.

## **Creating Docker Image**

The Dockerfile for this project encapsulates all dependencies and configurations required for deployment. The process is outlined below:

Step 1: Containerizing the Web Application

    - The base image, defined with the "FROM" command, is set to python:3.8-slim.
    - The working directory is set to '/app' using WORKDIR.
    - Application files are copied with COPY . /app, leveraging the current directory ('.') as the source and '/app' as the destination.
    - Python packages are installed from requirements.txt to satisfy dependencies outlined under the 'Prerequisites' section.
    - The Flask application's accessibility is established outside the container by exposing port 5000 with the "EXPOSE" command.
    - A start-up command is defined with "CMD" to initiate the Flask application, using CMD ["python","app.py"].

Step 2: Building the Docker Image

    - The Docker image is built with the command docker build -t {name of the image} . in the current directory.

Step 3: Running the Container on Local Machine

    - To test the image, docker run -p 5000:5000 {name of the image} is used, mapping port 5000 from the local machine to the container for application access.
    - Testing can be done by navigating to http://127.0.0.1:5000 in a web browser.

Step 4: Pushing the Image to Docker Hub

    - Tag the Docker image using docker tag {image-name} {docker-hub-username}/{image-name}:{tag}.
    - Finally, push the image to Docker Hub with docker push {docker-hub-username}/{image-name}:{tag}.

Refer to Dockerfile and requirements.txt in the main branch for the associated files.

### Terraform

Terraform serves as the foundational tool for provisioning an Azure Kubernetes Service (AKS) cluster. It enables infrastructure provisioning using Infrastructure as Code (IaC).

### **Setting Up Networking**

Establishing the network for the AKS cluster is a crucial step to ensure optimal functionality of networking services in Azure. Utilizing variables, main, and outputs Terraform files is recommended for structuring the infrastructure.

1. Variables
     - Resource group: A container managing Azure resources for deployment.
     - Location: The geographical location where the AKS cluster service will be situated.
     - Vnet address space: A defined range of virtual addresses enabling communication within the resource group.

2. Main
     - Azure resource group: A container overseeing the relevant Azure resources for management and deployment.
     - Virtual Network (VNet): Facilitates communication between resources.
     - Control Plane Subnet: Manages resources such as nodes and pods in the cluster.
     - Worker Node Subnet: A virtual machine handling a portion of an application's workload.
     - Network Security Group (NSG): Security rules governing inbound and outbound traffic for various Azure resources.

3. Outputs
    - vnet_id: Identification of the virtual network.
     - control_plane_subnet_id: Identification of the subnet for the control plane.
     - worker_node_subnet_id: Identification of the subnet for a worker node.
     - networking_resource_group_name: Resource group name for the networking aspects of the AKS cluster.
     - aks_nsg_id: Identification for the network security group.

After configuring the settings, initialize the directory using `terraform init`. The setup will be on the main branch in the `networking` directory.

### **Configuring AKS Cluster**

Establishing the cluster for the AKS cluster is crucial to ensure optimal functionality of Kubernetes services in Azure. It is recommended to utilize variables, main, and outputs Terraform files for constructing the infrastructure.


1. Variables
     - aks_cluster_name: The designated name for the provisioned cluster.
     - cluster_location: The location where the cluster is provisioned.
     - dns_prefix: The DNS prefix defining the cluster.
     - kubernetes_version: The version of the Kubernetes cluster.
     - service_principal_client_id: Client ID for the service principal associated with the cluster.
     - service_principal_secret: Password providing access to the cluster.
The output variables from the networking module include `'resource_group_name'`, `'vnet_id'`, `'control_plane_subnet_id'`, and `'worker_node_subnet_id'`.
2. Main
     - azurerm_kubernetes_cluster: Configuration of variables associated with the cluster's name, location, resource group name, DNS prefix, and Kubernetes version.
     - default_node_pool: Configuration for the cluster in Azure.
     - service_principal: Identity used for applications, hosted services, and automated tools to access resources.
3. Outputs
     - aks_cluster_name: The name of the provisioned cluster.
     - aks_cluster_id: ID of the AKS cluster.
     - aks_kubeconfig: The Kubernetes configuration file for the cluster, enabling interaction and management using kubectl.
After configuring the settings, initialize the directory using `terraform init`. The setup will be on the main branch within the `aks-cluster` directory.

### **Setting Up the AKS Cluster**
The parameters utilized in the creation of the AKS cluster are outlined below:

1. Networking
     - resource_group_name: "networking-rg"
     - location: "UK South"
     - vnet_address_space: ["10.0.0.0/16"]
2. AKS Cluster
     - cluster_name: "terraform-aks-cluster"
     - location: "UK South"
     - dns_prefix: "myaks-project"
     - kubernetes_version: "1.26.6"
     - service_principal_client_id: Azure client ID
     - service_principal_secret: Azure client secret
Output variables from the networking module include 'resource_group_name', 'vnet_id', 'control_plane_subnet_id', 'worker_node_subnet_id', and 'aks_nsg_id'.

After configuring the settings, initialize the directory using `terraform init`. The setup will be on the main branch within the `aks-terraform` directory. Once initialized, execute `terraform apply` to deploy the cluster in Azure AKS

![image](https://i.imgur.com/O4F9LKH.png)

## Introduction to Service Principals in Azure

A service principal serves as an identity for utilizing services, applications, and automated tools to interact with Azure resources. Roles assigned to the service principal determine the level of restricted access, enabling precise control over the resources that can be accessed and the extent of that access.

`az ad sp create-for-rbac --name {name} --role contributor --scopes /subscriptions/{your-subscription-id}
`

## Introduction to Kubernetes Orchestration

Kubernetes orchestrates the automation of scaling, software deployment, and management for containerized applications.

## Deployment and Service Manifests

To facilitate the Kubernetes deployment process, a manifest file named `application-manifest.yaml` has been created for this project. The `flask-app-deployment` is the designated name for the resource deployment responsible for managing the containerized web application. The manifest file specifies the deployment of 2 replica pods, utilizing the rolling strategy, and includes labels for effective pod management.

Additionally, a Service manifest named `flask-app-service` has been employed for internal communication. The service is configured to use the TCP protocol on `port 80`, with a target port of `5000`, mirroring the exposed port in the container. The service type has been set to `ClusterIP` to facilitate internal usage within the AKS cluster.

## Deployment Strategy

The chosen deployment strategy for this project is the `Rolling Update` method. This approach ensures a seamless transition by gradually replacing old pods with new ones when they become ready, minimizing downtime. This strategy supports high availability by allowing one pod to deploy while temporarily making the other unavailable. The Rolling Updates strategy is well-suited for applications with an internal nature, enabling updates without disrupting ongoing operations. It ensures a smooth transition from old to new pods, facilitating efficient maintenance and continuous improvement.

## Testing and Validation

Upon deploying the application on the AKS cluster, it is essential to conduct thorough testing and validation to ensure reliability and functionality. This process involves checking the status of services and pods to confirm correct exposure within the cluster.

To interact with the application, users initiate **port forwarding** to a local machine, enabling access to the web application at `http://127.0.0.1:5000`. During the testing phase, specific attention is given to the **orders table** and the **add order** functionality of the application. This ensures the proper display of information and validates the ability to add an order successfully. By meticulously validating these steps, the goal is to ensure that the application performs as expected in the AKS environment.

## Distribution and Accessibility

To distribute the application within the organization, allowing accessibility without relying on port forwarding, users can employ either a **Load Balancer** for external service exposure or an **Ingress resource**. This approach ensures secure access for internal users while also addressing external accessibility. For external access, additional security measures such as authentication and authorization may be implemented, leveraging tools like **OAuth** (authorization to another application) or **Azure AD** (Azure Active Directory). It is imperative to consider network policies and ensure secure communication through protocols like HTTPS to safeguard the application and its data against potential external threats. Comprehensive documentation and communication channels will be established to guide users on secure application access.

## CI/CD Pipelines with Azure DevOps

CI/CD Pipelines with Azure DevOps involves setting up **Continuous Integration (CI)** and **Continuous Delivery/Deployment (CD)** workflows using Azure DevOps services. This software development process aims to enhance development efficiency by automating the building, testing, and deployment of applications.

In the **Continuous Integration (CI)** phase, developers integrate code changes into a shared repository. Each integration undergoes automated builds, including tests, to detect integration errors at the earliest possible stage.

## Continuous Integration (CI) and Continuous Delivery (CD)

In **Continuous Integration (CI)**, developers integrate code changes into a shared repository. Each integration undergoes automated builds, including tests, to identify integration errors as early as possible.

**Continuous Delivery (CD)** automates the process of building, testing, and preparing code changes for production release.

### **Source Repository Configuration**

Our application's source code is hosted on GitHub. To get started, select the repository you wish to work with.

### **Starter Pipeline Template**

Once you've chosen the GitHub repository, initiate a pipeline using a Starter Pipeline template. This template provides a foundational structure to add tasks, including Docker image and Kubernetes file configurations.

### **Pipeline Trigger**

- By default, the pipeline is set to execute automatically on each push to the main branch of the application repository.
- For testing purposes, you can specify the branch you are testing.
- This setup facilitates Continuous Integration (CI), enabling thorough testing of changes before integration.

## Docker Hub 

**Setting up Service Connection**

1. Generate a personal access token on Docker Hub.
2. Configure an Azure DevOps service connection using the Docker Hub personal access token.
  - Specify the connection type as Docker Hub.
  - Use your Docker ID as the username.
  - Input the personal access token as the password.
  - Verify the details and save the configuration.

![image](https://i.imgur.com/emLTp4o.png)

**Pipeline Docker Image Build and Push:**

1. Search for 'Docker' in the task search bar and select it.
2. Choose a Docker registry service connection for the container registry.
3. Specify the repository name for the Docker image on Docker Hub.
4. Add the Docker task to the pipeline with the 'buildandPush' command.
5. Set the path to the Dockerfile in the repository (default is the main branch).
6. Optionally, add a relevant tag to the image (e.g., 'latest').

![image](https://i.imgur.com/SSCOLwz.png)

### **AKS Integration**

1. Establish a service connection within Azure DevOps to securely link the CI/CD pipeline with the AKS cluster.
2. **Environment** The environment refers to the Azure cloud environment where your AKS cluster resides. It could be Azure Public Cloud (default), Azure Government, Azure China, or Azure Stack.
3. **Server URL** The Server URL is the endpoint used to communicate with the Azure Resource Manager API. It typically takes the form of https://management.azure.com/.
4. **Scope Level** Scope level denotes the level of access control applied to Azure resources within your AKS cluster. This could range from subscription-level access to resource group-level access, or even more granular control at the individual resource level. When integrating AKS with ARM, you define the appropriate scope level to ensure that your AKS cluster has the necessary permissions to interact with Azure resources.
5. **Subscription ID** The Subscription ID uniquely identifies your Azure subscription. It's a GUID (Globally Unique Identifier) assigned to your subscription when you create it.
6. **Subscription Name** The Subscription Name is the friendly name associated with your Azure subscription. It's a human-readable label to help identify your subscription among others you may have access to.
7. **Service Principal ID** The Service Principal ID, also known as the Client ID, is a unique identifier assigned to the service principal, which represents an identity used by applications, services, and automation tools to access Azure resources.
8. **Service Principal Key or Credential** The Service Principal Key, also known as the Client Secret, is a secret key associated with the service principal. It's used as part of the authentication process when the service principal accesses Azure resources.
9. **Tenant ID** The Tenant ID uniquely identifies your Azure Active Directory tenant. It's a GUID assigned to your AAD tenant when it's created.
10. **Service Connection Name** The Service Connection Name is the name given to the connection established between your AKS cluster and Azure DevOps or another tool for CI/CD pipelines. It's a label to identify the connection within your CI/CD pipeline configuration.

![image](https://i.imgur.com/KBIXWUw.jpeg)

### **Deploy to Kubernetes Task**

1. Search for 'Kubernetes' in the task search bar and select it.
2. Modify your pipeline to include the Deploy to Kubernetes task using the 'deploy' command.
3. Set the following parameters:
   - **connectionType:** 'azureResourceManager' since it's deployed on AKS (Azure Kubernetes Service).
   - **azureSubscriptionConnection:** Choose the subscription you want to use.
   - **azureResourceGroup:** Specify the resource group where you want the application deployed (must match the resource group in main.tf).
   - **kubernetesCluster:** Provide the name of the cluster (must match the cluster name in main.tf).
   - **manifests:** Name of the file containing the Kubernetes manifests to deploy (the file must be in your remote repository).

![image](https://i.imgur.com/e6f8nvA.png)

### **Validation Steps**

1. **CI/CD Pipeline Execution:**

- Successfully run the CI/CD pipeline to build and push the Docker image from Docker Hub. The image was then deployed to the AKS cluster.
- Use ``kubectl get pods`` to verify that the application pods were successfully deployed and are running within the cluster.
- This is where Continuous Delivery (CD) comes into play as you are automating the deployment process, ensuring efficient and consistent application delivery.

2. **Testing the Deployed Cluster**

- Monitor the status of the pods within the AKS cluster to ensure they are healthy.
- Access the application by initiating port forwarding using `kubectl`.
- Test the application's functionality locally to ensure it operates correctly within the AKS cluster.


## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.