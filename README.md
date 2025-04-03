# Azure Cloud Infrastructure Lab

## Overview
This project demonstrates the setup of a cloud-based IT infrastructure for **AZFK-Tech**, a fictional company, using **Microsoft Azure**. The project includes **virtual machines (VMs), networking, security policies, databases, a web application, shared storage, and monitoring services**.

## 🎯 Project Objectives

- **Created Azure Resource Groups** for three departments — Marketing & Sales (`jmoore-mas`), IT (`jmoore-it`), and HR (`jmoore-hr`) — to simulate department-based cloud infrastructure management.

- **Configured Isolated Virtual Networks (VNets)** for each department:
  - `MAS-VNET`: 172.171.224.0/24  
  - `IT-VNET`: 172.191.41.0/24  
  - `HR-VNET`: 172.191.11.0/24  

- **Implemented Network Security Group (NSG) policies** per department:
  - **MAS & HR**: Blocked ICMP (ping), blocked RDP/SSH, allowed HTTPS-only  
  - **IT**: Allowed ping to MAS & HR, full remote access, allowed HTTPS-only  

- **Deployed Windows Server 2022 VMs** in each department’s resource group and provisioned separate **Azure SQL Databases** with custom datasets via SQL queries.

- **Launched a Web Application** for the Marketing & Sales department to simulate customer-facing services.

- **Configured Azure File Storage and Azure Blob Containers** with **encryption keys** to enable secure inter-department file sharing.

- **Enabled Azure Monitor** for real-time insights into performance metrics across all VMs, SQL databases, and the MAS web application (CPU, memory, disk usage, web app responsiveness).

- **Exported Resource Group ARM templates** via PowerShell for backup and repeatable infrastructure deployment.

- **Recorded and presented** a sales pitch video demonstrating cloud capabilities for a fictitious company (**AZFK Tech**) to simulate stakeholder engagement.

# Azure Cloud Infrastructure Lab 🖥

## 📺 **Watch the Video: Cloud Infrastructure Presentation Video**

[![TechGneek - Azure Cloud Infrastructure Deployment (Presentation)](https://github.com/user-attachments/assets/41439133-1f38-428e-92d3-b620a2f7ac31)](https://www.youtube.com/watch?v=VbakPny5AnM&t=402s)

- **In this video, I present the cloud infrastructure designed for AZFK Tech, showcasing how Azure can support departmental segmentation, security, and scalability.**
- **It’s a high-level overview and pitch to company leadership, demonstrating the value of custom Azure environments for modern business operations.**

## **Skills Learned**
By completing this lab, you will gain hands-on experience in:
- **Azure Resource Management** – Creating and managing **Resource Groups, VNets, and Virtual Machines**.
- **Networking & Security** – Configuring **Network Security Groups (NSGs)** and enforcing security policies.
- **Database Administration** – Deploying and managing **Azure SQL Databases**.
- **Web Hosting** – Hosting a **web application** using **Azure App Services**.
- **Storage Solutions** – Implementing **Azure Files for shared storage**.
- **Monitoring & Optimization** – Using **Azure Monitor** to track system performance.
- **Infrastructure as Code (IaC)** – Exporting and managing **ARM templates** for future deployments.

---

## Table of Contents

1. [Set Up Department Group Resources](#1-set-up-department-group-resources)
2. [Configure Virtual Networks (VNets)](#2-configure-virtual-networks-vnets)
3. [Deploy Virtual Machines (VMs)](#3-deploy-virtual-machines-vms)
4. [Implement Security Policies](#4-implement-security-policies)
5. [Set Up Databases](#5-set-up-databases)
6. [Deploy Web Application](#6-deploy-web-application)
7. [Configure Shared Storage](#7-configure-shared-storage)
8. [Set Up Monitoring with Azure Monitor](#8-set-up-monitoring-with-azure-monitor)
9. [Export ARM Templates for Future Deployment](#9-export-arm-templates-for-future-deployment)
10. [Challenges & Fixes](#10-challenges--fixes)

## **Project Steps**
### **1. Set Up Department Group Resources**
- Created resource groups for each department:
  - **Marketing and Sales (MAS)** – `jmoore-mas`
  - **IT** – `jmoore-it`
  - **HR** – `jmoore-hr`
- 📸 **Screenshot Evidence:** ![View Below]

<img width="1560" alt="Screen Shot 2025-02-03 at 10 40 12 PM" src="https://github.com/user-attachments/assets/200d3ad7-ffbd-429e-b030-1ad5b658e6ae" />

### **2. Configure Virtual Networks (VNets)**
- Created separate VNets for each department:
  - **MAS-VNET** – `172.171.224.0/24`
  - **IT-VNET** – `172.191.41.0/24`
  - **HR-VNET** – `172.191.11.0/24`
- 📸 **Screenshot Evidence:** ![View Below]

<img width="1543" alt="Vnets For MAS+IT+HR" src="https://github.com/user-attachments/assets/4289d76e-38ce-4d0d-a736-9e24a8aba5a8" />

### **3. Deploy Virtual Machines (VMs)**

| Department  | VM Name   | OS             | Public IP Address     | Purpose                 |
|------------|----------|---------------|----------------------|-------------------------|
| MAS        | MasAdmin | Windows 10    | `172.171.224.237`    | Sales & Marketing Ops   |
| IT         | ITAdmin  | Windows Server | `172.191.41.239`     | IT Management           |
| HR         | HRAdmin  | Windows 10    | `172.191.11.73`      | Employee Management     |

- 📸 **Screenshot Evidence:** ![View Below]

<img width="1543" alt="VM's for MAS+IT+HR" src="https://github.com/user-attachments/assets/0c95c4aa-9870-416b-b3f3-1ce1d0d0de3a" />

### **4. Implement Security Policies**
- Created and applied NSGs:
  - **MAS & HR:** No ping access, no remote access, only secure web access.
  - **IT:** Can ping MAS & HR, full remote access, only secure web access.
- 📸 **Screenshot Evidence:** ![View Below]

<div align="center">
  <table>
    <tr>
      <td><img width="500" alt="NSG Rules for Marketing & Sales" src="https://github.com/user-attachments/assets/85c4d725-fe34-4c27-ac1e-ea81470918bb" /></td>
      <td><img width="500" alt="NSG Rules for Human Resources" src="https://github.com/user-attachments/assets/c9ed9e72-1234-45ff-9db1-d7468d7cfebd" /></td>
      <td><img width="500" alt="NSG Rules for IT Dept" src="https://github.com/user-attachments/assets/df430039-0140-4671-9223-01979e83b18d" /></td>
    </tr>
  </table>
</div>

### **5. Set Up Databases**
- Deployed **Azure SQL databases**:
  - **MAS-Database** – Sales & marketing records.
  - **IT-Database** – IT asset inventory.
  - **HR-Database** – Employee records.
- 📸 **Screenshot Evidence:** ![View Below]

<div align="center">
  <table>
    <tr>
      <td><img width="500" alt="SQL Commands+Database for MAS" src="https://github.com/user-attachments/assets/53b7166a-f0cb-4b71-b1f1-89b1cf1914f4" /></td>
      <td><img width="500" alt="SQL Commands+Database for IT" src="https://github.com/user-attachments/assets/44335e1b-9094-4c30-8794-b066991d6b81" /></td>
      <td><img width="500" alt="SQL Commands+Database for HR" src="https://github.com/user-attachments/assets/96995186-a534-4449-9025-0fdc56acc5c1" /></td>
    </tr>
  </table>
</div>

### **6. Deploy Web Application**
- Set up a **web app** using Azure App Services for the MAS department.
- Displayed homepage message: **“Welcome to AZFK-Tech World”**.
- 📸 **Screenshot Evidence:** ![View Below]

<div align="center">
  <table>
    <tr>
      <td><img width="500" alt="Custom WebApp Site Deployed on Custom Domain" src="https://github.com/user-attachments/assets/1e326b39-b16e-4739-bf4f-c78af9d41cdd" /></td>
      <td><img width="500" alt="Azure App Services Server Deployed" src="https://github.com/user-attachments/assets/6473ee08-a94f-4544-96ca-a074d8685051" /></td>
    </tr>
  </table>
</div>

### **7. Configure Shared Storage**
- Created **Azure Files storage** for department collaboration.
- 📸 **Screenshot Evidence:** ![View Below]

<div align="center">
  <table>
    <tr>
      <td><img width="500" alt="Azure Shared Storage Deployment" src="https://github.com/user-attachments/assets/577dd14d-4ab1-438b-9a65-de1f39425054" /></td>
      <td><img width="500" alt="Azure FileShare for Shared Storage" src="https://github.com/user-attachments/assets/5b45f059-6687-424a-a2a5-679837048f17" /></td>
    </tr>
  </table>
</div>


### **8. Set Up Monitoring with Azure Monitor**
- Configured **Azure Monitor** to track VM performance.
- 📸 **Screenshot Evidence:** ![View Below]

<div align="center">
  <table>
    <tr>
      <td><img width="500" alt="Azure Monitor for MAS Insights" src="https://github.com/user-attachments/assets/8d2d15ed-3bb0-4043-9761-8eb3a6c2fca9" /></td>
      <td><img width="500" alt="Azure Monitor for IT Insights" src="https://github.com/user-attachments/assets/19899fdf-161a-4666-92dd-ed974d6af82d" /></td>
    </tr>
    <tr>
      <td><img width="500" alt="Azure Monitor for HR Insights" src="https://github.com/user-attachments/assets/f48b3d4e-09be-4d04-a2cd-507d3aaef30c" /></td>
      <td><img width="500" alt="Azure Monitor Deployed" src="https://github.com/user-attachments/assets/d7338f21-209d-4b05-8b10-69f99f27dce3" /></td>
    </tr>
  </table>
</div>

### **9. Export ARM Templates for Future Deployment**
- Used PowerShell to export ARM templates.
- **Exported ARM Template Location:** `/Users/jamesmoore/Desktop/ARM Templates`

#### **PowerShell Script for Exporting ARM Templates:**
```powershell
# Define the list of resource groups to export
$resourceGroups = @(
    "DefaultResourceGroup-CCAN",
    "DefaultResourceGroup-EUS",
    "DefaultResourceGroup-EUS2",
    "Jmoore-HR",
    "Jmoore-IT",
    "Jmoore-MAS",
    "NetworkWatcherRG",
    "ResourceMoverRG-eastus-eastus2-eus2"
)

# Define the export path (Mac's Desktop "ARM Templates" folder)
$exportPath = "/Users/jamesmoore/Desktop/ARM Templates"

# Ensure the export directory exists
if (!(Test-Path -Path $exportPath)) {
    New-Item -ItemType Directory -Path $exportPath | Out-Null
}

# Loop through each resource group and export the ARM template
foreach ($rg in $resourceGroups) {
    $filePath = "$exportPath/$rg-template.json"
    
    try {
        Export-AzResourceGroup -ResourceGroupName $rg -Path $filePath -Force
        Write-Output "✅ Successfully exported $rg to $filePath"
    } catch {
        Write-Output "❌ Failed to export $rg. Error: $_"
    }
}

Write-Output "🎯 All resource groups have been processed."
```

---

### **10. Challenges & Fixes**
#### **Errors Encountered & Fixes:**
1️⃣ **PowerShell Module Not Installed**
   - **Fix:** Installed Azure PowerShell module: `Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force`

2️⃣ **ExportTemplateProviderError**
   - **Fix:** Manually exported missing resources via Azure Portal.

3️⃣ **ExportVirtualMachineExtensionNotSupported**
   - **Fix:** Ignored non-exportable VM extensions; redeployed manually after main template deployment.

📸 **Screenshots of Fixes:** ![View Below]

<img width="1516" alt="Screen Shot 2025-02-03 at 8 35 25 PM" src="https://github.com/user-attachments/assets/8c044ed5-737d-47cd-bd36-2f8f1fe2db19" />

---

## **Conclusion**
This project successfully demonstrates **Azure cloud infrastructure deployment** with **networking, security, databases, web hosting, shared storage, monitoring, and Infrastructure as Code (IaC) via ARM templates**.

---



