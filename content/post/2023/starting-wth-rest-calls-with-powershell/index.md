---
title: "Starting Wth API Rest Calls With Powershell"
date: 2023-08-17T09:09:54+01:00
Description: ""
Tags:
    - PowerShell
    - REST
    - API
Categories:
    - Azure 
    - Azure Native
DisableComments: false
draft: yes
---

## What are we doing?

I am working more and more with the Azure REST APIs now. My [first dive into cost management](https://cloud.fskelly.com/post/2023/azure-cost-management-playing-with-api-in-powershell/) was a big hit, so I am expanding on that. The main consideration around that particular API is that is it open. Bu this, I mean a simple HTTP request will return results, no authentication or additional headers or the like are needed. So nice and easy. As we dive more into API and REST API's, this is likely to change. This post, with more planned, is designed to make this easier and break it down into smaller chunks. THese chunks/snippets can be re-used and the principles in the chunks/snippets can be applied to other API's. These in particular are aimed at Azure API's.

## Constraints / limitations

1. Primary focus is on the Azure API.
1. Using Azure Tokens.
1. ENterprise Application is already registered.
1. You have securely stored your secret for the above point.

