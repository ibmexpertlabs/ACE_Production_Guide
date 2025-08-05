# Create the Cluster

**Audience:** Architects, Application Developers, Administrators

## Overview

In this topic, you will:

- Learn how to provision an OpenShift cluster on IBM Cloud
- Understand the cluster reservation process
- Configure cluster specifications for ACE workloads
- Monitor cluster provisioning status

By the end, you'll have a production-ready OpenShift cluster configured for App Connect Enterprise deployment.

## Prerequisites

Before creating your cluster, ensure you have:

- IBM Technology Zone account access
- Valid IBM credentials
- Understanding of your cluster requirements
- Network access to IBM Cloud services

## Cluster Creation Process

### 1. Navigate to IBM Technology Zone

1. In your browser, go to [IBM Technology Zone → Create Reservation](https://techzone.ibm.com/my/reservations/create/619e5691425423001fcc192e)
2. If you're not signed in, authenticate with your IBM credentials
3. Read and accept **Terms and Conditions** if prompted

### 2. Reserve a Cluster

On the **Environment Catalog** page, select **OpenShift Cluster (OCP-v) – IBM Cloud** and click **Reserve environment**.

![Select OpenShift Cluster](images/right-cluster.png)

### 3. Complete the Reservation Form

#### Step 1: Basic Details

Fill out the top section:

- **Cluster Name** - Choose a descriptive name for your cluster
- **Purpose** - Select from the available options
- **Description** - Required if you choose "Practice/Self-Education"
- **Sales Opportunity Number** - Include if you have one

![Reservation Form](images/reservation.png)

#### Step 2: Advanced Options

Scroll down and configure the cluster specifications:

- **Preferred Geography** - Choose your preferred region (e.g., `London 5`, `HongKong 2`, `San Jose 04`)
- **End Date & Time** - Adjust default 3-day retention if needed
- **Worker Node Count:** `3` (recommended for production workloads)
- **Worker Node Flavor:** `4 vCPU x 16GB 100GB` (minimum for ACE workloads)

!!! tip "Tip"
    Keeping the default 3-day window is usually sufficient. GitOps makes reprovisioning quick if you need another environment.

!!! note "Important Notes"
    - **Provisioning takes 3–5 hours**
    - **By default, your cluster auto-deletes after 2 days**
    - Use **Schedule for later** if you plan to reserve it for a future demo or session

### 4. Watch for Email Notifications

You'll receive several email notifications during the provisioning process:

- **Provisioning Started** - Build process has begun
- **Cluster Ready** - Includes your cluster URL and expiry information
- **Daily Notice** - When 3 days remain until auto-deletion

To extend your cluster, visit **My reservations → Extend**.

### 5. Track Status in IBM Technology Zone

1. Go to **My reservations**
2. Monitor the **Status** column
3. When it reads **Ready**, your cluster is live and accessible

![Cluster Ready Status](images/cluster-ready.png)

### 6. Access Your Cluster

Once ready, click the **Cluster URL** to open the OpenShift Console and begin navigating your new cluster.

![OpenShift Console](images/cluster.png)

## Cluster Specifications

### Minimum System Requirements

For Cloud Pak for Integration 16.1.2, ensure your cluster meets these minimum requirements:

| Component | Minimum Specification | Notes |
|-----------|----------------------|-------|
| **OpenShift Version** | 4.16+ | Latest stable release with full CP4I support |
| **Worker Nodes** | 3 | Required for high availability deployment |
| **Node Flavor** | 4 vCPU x 16GB | Minimum for CP4I foundational services |
| **Storage** | Block RWO storage class | Required for Cloud Pak foundational services |

### Storage Requirements for High Availability

Cloud Pak for Integration requires specific storage configurations for high availability deployments:

#### Cloud Pak Foundational Services
- **Storage Type:** Block RWO
- **Volumes Required:** 2 volumes (HA configuration)
- **Purpose:** Cloud Native PostgreSQL replicas for Keycloak

#### App Connect Enterprise Components
- **Integration Runtime:** No persistent storage required
- **Integration Dashboard:** File RWX or S3 object storage (minimum 1 IOPS/GB)
- **Integration Design:** Block RWO, RWX, or S3 storage
  - **Non-HA:** 1 volume
  - **HA:** 3 volumes (one per CouchDB replica)

#### Additional CP4I Services (if deployed)
- **API Connect:** 40 volumes (HA configuration)
- **Event Manager:** Block RWO storage
- **Kafka Cluster:** 6 volumes (HA: 3 broker + 3 ZooKeeper)
- **Messaging Server:** 3 volumes (HA configuration)

!!! important "Storage Class Configuration"
    The installation process automatically selects the default storage class for your cluster. 
    Ensure your OpenShift administrator has configured a default storage class that meets 
    the Block RWO requirements for Cloud Pak foundational services.

### Resource Allocation Guidelines

For production environments, consider these resource allocations:

- **CPU:** Allocate based on expected workload (typically 0.5-2 cores per integration runtime)
- **Memory:** 512MB-2GB per integration runtime
- **Network:** Standard cluster networking with proper ingress/egress configuration

## Post-Provisioning Steps

Once your cluster is ready, you'll need to:

1. **Verify Storage Configuration** - Ensure Block RWO storage class is properly configured
2. **Configure GitOps** - Set up ArgoCD for continuous deployment and high availability
3. **Install Cloud Pak for Integration** - Deploy CP4I with high availability configuration
4. **Configure ACE Services** - Set up App Connect Enterprise with HA deployment
5. **Set up Monitoring** - Configure logging and metrics collection for production monitoring

## Troubleshooting

### Common Issues

**Cluster Provisioning Delays**
- Check IBM Technology Zone status page
- Verify your reservation details
- Contact support if delays exceed 6 hours

**Access Issues**
- Verify your IBM credentials
- Check network connectivity
- Ensure you're using the correct cluster URL

**Resource Limitations**
- Monitor cluster resource usage
- Scale worker nodes if needed
- Optimize ACE application resource requests

### Support Resources

- [IBM Technology Zone Documentation](https://techzone.ibm.com/docs)
- [OpenShift Documentation](https://docs.openshift.com/)
- [Cloud Pak for Integration 16.1.2 Documentation](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.2)
- [System Requirements for CP4I](https://www.ibm.com/docs/en/cloud-paks/cp-integration/16.1.2?topic=planning-system-requirements)
- [ACE Operator Documentation](https://www.ibm.com/docs/en/app-connect/12.0.x)

---

**Next Steps:** Once your cluster is ready, proceed to [Configure the Cluster](configure-cluster.md) to set up GitOps and prepare for ACE deployment. 