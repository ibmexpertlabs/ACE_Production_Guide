# The ACE Tutorial

**Audience:** Architects, Application Developers, Administrators

## Overview

In this topic, we're going to:

- Introduce you to the ACE tutorial
- Outline the structure of the tutorial
- Explain the cloud-native approach to ACE deployment

By the end of this topic, you will understand the ACE tutorial and how it can help you design and build cloud-native ACE systems.

## Introduction

IBM Cloud Pak for Integration includes a market-leading application integration capability called **App Connect Enterprise (ACE)**. It enables the implementation of API and event-driven integrations and provides extensive adaptation to on-premises and cloud-based applications. 

ACE provides tooling that is optimized to users' skillsets, allowing them to be productive in a matter of hours and achieve real results in days. Powerful underlying capabilities facilitate the implementation of even the most complex integration patterns, ensuring data can be moved quickly, accurately, and robustly.

### Purpose of This Guide

The purpose of this guide is to teach you how to deploy an ACE application on **OpenShift Container Platform** using modern cloud-native practices. We will be using:

- **Cloud Pak for Integration (CP4I)**
- **Containers and Operators**
- **Microservices architecture**
- **Immutable infrastructure**
- **Declarative APIs**

This approach creates a best-practice-based, production-ready deployment of an ACE message flow. You will also learn how technologies such as **OpenShift Pipelines (Tekton)** and **OpenShift GitOps (ArgoCD)** integrate in a production environment.

## Tutorial Structure

This tutorial is divided into chapters that help you build, step-by-step, an ACE integration server based on a cloud-native approach. Each chapter comprises topics which you should complete in order to gain a full understanding.

### Example Integration Flow

The tutorial uses an example integration flow that will:
- Communicate with a backend service
- Retrieve data from the service
- Send back a response to the user

This practical example demonstrates real-world integration patterns and best practices.

### Development and Operations Lifecycle

The tutorial is structured to match the modern development and operations lifecycle:

1. **Install and Upgrade** - Setting up the foundation
2. **Build and Test** - Creating and validating your integration
3. **Deployment** - Getting your application into production
4. **Promotion** - Managing environments and releases

This lifecycle approach ensures you understand not just how to build ACE applications, but how to operate them effectively in production environments.

## What You'll Learn

Throughout this tutorial, you'll gain hands-on experience with:

- **OpenShift Container Platform** fundamentals
- **GitOps workflows** with ArgoCD
- **CI/CD pipelines** with Tekton
- **ACE application development** and deployment
- **Production best practices** for enterprise integration
- **Monitoring and observability** for ACE applications

## Prerequisites

Before starting this tutorial, ensure you have:

- Basic understanding of Kubernetes concepts
- Familiarity with container technologies
- Knowledge of integration patterns and APIs
- Access to an OpenShift 4.16+ cluster
- IBM Cloud Pak for Integration entitlement

---

**Ready to begin?** Follow the tutorial chapters in order to build your first cloud-native ACE application. 