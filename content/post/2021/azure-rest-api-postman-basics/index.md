+++
author = "Fletcher Kelly"
title = "Azure Rest Api Postman Basics"
date = "2021-04-14T09:02:18+02:00"
Tags = [
    "azure", 
    "api", 
    "postman"
    ]
Categories = [
    "Azure", 
    "API"
    ]
Description = "Using Postman with the Azure REST API"
DisableComments = false
+++

# Absolute basics with Azure and [PostMan](www.postman.com)

## Getting started

Many of the articles I have found online with regards to the [Azure REST API](https://docs.microsoft.com/en-us/rest/api/azure/) assume a fair level of familiarity with [Azure](https://azure.microsoft.com/en-us/) which can be a good and bad thing. You see the [Azure Portal](https://portal.azure.com) makes interacting with the Azure REST API very easy as a lot of the "prerequisite" work is done in the portal as part of the process. For this blog post we will work on something quite basic, "[Create a Virtual Machine](https://portal.azure.com/#create/Microsoft.VirtualMachine)".  

[Jon Gallant](https://twitter.com/jongallant) has some great content around this and I did use some content from [here](https://blog.jongallant.com/2021/02/azure-rest-apis-postman-2021/), thank you [Jon Gallant](https://twitter.com/jongallant).  

Within the Azure Portal this is very easy and only requires a few clicks, however under the hood, in order for the Azure REST API to work, there is a lot more going on. Lets dive in :smile:

### API Order

1. Have a [Resource Group](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal) available or create one.
1. Have a [Virtual Network (VNET)](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview) available or create one.
1. Create a [Virtual Network Interface Card (NIC)](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-network-interface) or create one.
1. Create a [Virtual Machine](https://azure.microsoft.com/en-us/services/virtual-machines/).

There is a lot of association and the like that goes on in the background.

1. Resource Group created.
1. NIC associated to VNET.
1. NIC associated to VM.
1. VM created in Resource Group.

### Using the API

So, what I have done, is simply create a collection within [Postman](www.postman.com) that uses both collection variables and "Pre-request" scripts to make this collection "portable".

### Postman Collection

I use a set of collection variables to help with the initial API Call.
![Postman Api Collection](https://github.com/fskelly/flkelly-cloudblog/blob/63833ed0ffe8296fb18d9797663c0cb4a2c305f1/static/images/blogImages/2021/restapipostmanpost/postmanApiCollection.png?raw=true)
With each of the call you will the variables enclosed with "**{}**" and path variables prefixed with "**:**"
![Postman with Variables](https://github.com/fskelly/flkelly-cloudblog/blob/63833ed0ffe8296fb18d9797663c0cb4a2c305f1/static/images/blogImages/2021/restapipostmanpost/postmanVariables.png?raw=true)
With most of the Postman queries, the "**Pre-request Script**" is also used, this is used to set "extra" pieces of information, for example, specifying a location for the Resource Group.
![Postman with pre-request script](https://github.com/fskelly/flkelly-cloudblog/blob/63833ed0ffe8296fb18d9797663c0cb4a2c305f1/static/images/blogImages/2021/restapipostmanpost/postmanApiPreRequestScript.png?raw=true)

So, go forth and play. My Postman Collection can be found [here](https://github.com/fskelly/flkelly-cloudblog/blob/main/blogFiles/azureApiPostman/Azure%20REST%20-%20repo%20ready.postman_collection.json)
