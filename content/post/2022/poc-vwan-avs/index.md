---
title: "Using vWan to connect to AVS"
date: 2022-03-28T07:27:16+01:00
Description: ""
Tags: []
Categories: []
DisableComments: false
draft: true
---

**These files are NOT production ready, they used to explain concepts and better prepare you for production.**

## What are we going to deploy?

I use this [link](https://mecdata.it/en/2020/06/configure-a-point-to-site-vpn-connection-via-openvpn/) as a base for building the certificates (self-signed) for the Point-To-Site connections, if you choose to deploy this. I have this as modular as possible with [booleans](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/bicep-functions-logical#bool) in [Bicep](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview?tabs=bicep) to make this is as customizable as possible for you.

