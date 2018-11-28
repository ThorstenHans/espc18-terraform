# ESPC 2018 - Terraform Sample

In order to use the terraform script, ensure you've installed [Terraform](https://terraform.io) on your machine.

## Slides

Slides from the talk are located at https://thns.io/2KFhSgD

## Azure Authentication

You can authenticate either by using Azure CLI (`az login`) or you can specify a service principal id and the corresponding password as environment variables

Use `ARM_CLIENT_ID` for Service Principals Id and `ARM_CLIENT_SECRET` for the password. 

## Azure Subscription Selection

If you're using Azure CLI for authentication, Terraform will deploy stuff to the currently selected subscription, alternatively you can specify the subscription id as an environment variable too. (`ARM_SUBSCRIPTION_ID`)



