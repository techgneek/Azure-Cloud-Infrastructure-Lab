# Azure Cloud Infrastructure Lab

## Overview
This project demonstrates the setup of a cloud-based IT infrastructure for **AZFK-Tech**, a fictional company, using **Microsoft Azure**. The project includes **virtual machines (VMs), networking, security policies, databases, a web application, shared storage, and monitoring services**.

## **Objective**
The objective of this lab is to design and deploy a secure and scalable **Azure cloud infrastructure** that simulates a real-world enterprise environment. This includes:
- Configuring **networking and security policies** for department-specific isolation.
- Deploying and managing **Azure virtual machines and storage solutions**.
- Setting up **Azure SQL databases and web applications**.
- Implementing **monitoring and alerting systems** for resource optimization.
- Automating deployment using **ARM templates**.

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
9. [Export ARM Templates for Future Deployment](https://github.com/techgneek/Azure-Cloud-Infrastructure-Lab/edit/main/README.md#9-export-arm-templates-for-future-deployment)
10. [Challenges & Fixes](#challenges--fixes)

## **Project Steps**
### **1. Set Up Department Group Resources**
- Created resource groups for each department:
  - **Marketing and Sales (MAS)** – `jmoore-mas`
  - **IT** – `jmoore-it`
  - **HR** – `jmoore-hr`
- 📸 **Screenshot Evidence:** ![View Here](#)

### **2. Configure Virtual Networks (VNets)**
- Created separate VNets for each department:
  - **MAS-VNET** – `172.171.224.0/24`
  - **IT-VNET** – `172.191.41.0/24`
  - **HR-VNET** – `172.191.11.0/24`
- 📸 **Screenshot Evidence:** ![View Here](#)

### **3. Deploy Virtual Machines (VMs)**

| Department  | VM Name   | OS             | Public IP Address     | Purpose                 |
|------------|----------|---------------|----------------------|-------------------------|
| MAS        | MasAdmin | Windows 10    | `172.171.224.237`    | Sales & Marketing Ops   |
| IT         | ITAdmin  | Windows Server | `172.191.41.239`     | IT Management           |
| HR         | HRAdmin  | Windows 10    | `172.191.11.73`      | Employee Management     |

- 📸 **Screenshot Evidence:** ![View Here](#)


### **4. Implement Security Policies**
- Created and applied NSGs:
  - **MAS & HR:** No ping access, no remote access, only secure web access.
  - **IT:** Can ping MAS & HR, full remote access, only secure web access.
- 📸 **Screenshot Evidence:** ![View Here](#)

### **5. Set Up Databases**
- Deployed **Azure SQL databases**:
  - **MAS-Database** – Sales & marketing records.
  - **IT-Database** – IT asset inventory.
  - **HR-Database** – Employee records.
- 📸 **Screenshot Evidence:** ![View Here](#)

### **6. Deploy Web Application**
- Set up a **web app** using Azure App Services for the MAS department.
- Displayed homepage message: **“Welcome to AZFK-Tech World”**.
- 📸 **Screenshot Evidence:** ![View Here](#)

### **7. Configure Shared Storage**
- Created **Azure Files storage** for department collaboration.
- 📸 **Screenshot Evidence:** ![View Here](#)

### **8. Set Up Monitoring with Azure Monitor**
- Configured **Azure Monitor** to track VM performance.
- 📸 **Screenshot Evidence:** ![View Here](#)

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

📸 **Screenshots of Fixes:** ![View Here](#)

---

## **Conclusion**
This project successfully demonstrates **Azure cloud infrastructure deployment** with **networking, security, databases, web hosting, shared storage, monitoring, and Infrastructure as Code (IaC) via ARM templates**.

---



