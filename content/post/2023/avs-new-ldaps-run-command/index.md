---
title: "New LDAPS run-command for Azure VMware Solution"
date: 2023-05-19T09:39:57+01:00
Description: ""
Tags:
    - AVS
    - Identity
    - LDAPS
Categories: 
    - Azure VMware Solution
DisableComments: false
draft: false
series: LDAP
---

## What are we doing?

Showing a newer version of the New-LDAPSIDentitySource Run-Command within Azure VMware Solution

## Lets build this

If you have been following along and you have used our previous article(s) - [AZURE VMWARE SOLUTION: A COMPREHENSIVE GUIDE TO LDAPS IDENTITY INTEGRATION - PART 1](https://cloud.fskelly.com/post/2023/avs-ldaps-configure-part1/) - you would have realized that this quite a process. We took our many customers feedback to our Product Group (PG) within [Microsoft](https://www.microsoft.com) and we have worked with them, to create a new version of the "Run-Command" and this has been released publicly.

You are looking for the "5.3.54" version of the run commands and "New-LDAPSIdentitySource"

{{< figure src="/images/blogImages/2023/avs-ldaps-new-run-command/new-avs-run-command-version.png" alt="new version of the tools" >}}

You will notice that the "SSLCertificateSasUrl" field is now **OPTIONAL**. The "i" information bubble will now explain how it works. Basically the service now looks for the Domain Controllers based upon the information you provide and now connects and attempts to download the certificates automatically. Provided you have the pre-requisites in place, Like a Certificate Authority (CA), this works really well and speeds up the process tremendously and removes lot of complexity like dealing with Stroage Accounts, uploading the certificates and creating the required SAS Tokens.

{{< figure src="/images/blogImages/2023/avs-ldaps-new-run-command/new-avs-run-command-new-1.png" alt="information block explaining the new process" >}}

A very welcome change.
