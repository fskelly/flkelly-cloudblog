---
title: "Azure Ghost Cms and Cdn"
date: 2021-01-11T07:00:18+02:00
Description: ""
Tags: ["azure","cdn","blog","hugo"]
Categories: []
DisableComments: false
---

I moved my blog onto HUGO. Not everyone would want to do this necessarily, there is a bit of a learning curve, part of the reason **I DID IT** :). However there are other platforms you can use and still add more functionality if you want.  

You can use [Ghost](https://ghost.org/) and add an [Azure CDN](https://docs.microsoft.com/en-us/azure/cdn/cdn-overview). This is what this blog post will cover.

There are some very clever people out there that have made this very easy for you. From my research you have 2 main options.

1. A "simple Web App"
2. More complex deployment with Containers and a CDN - now this sounds interesting.  

For this post I naturally focused on **option 2** :). A **BIG** shoutout goes to [Andrew Matveychuk](https://andrewmatveychuk.com/about/). I am all about __**"Standing on the shoulders of giants**"__. I used his [repo](https://github.com/andrewmatveychuk/azure.ghost-web-app-for-containers) and then forked it into mine. He has a nice [blogpost](https://andrewmatveychuk.com/a-one-click-ghost-deployment-on-azure-web-app-for-containers/) on his journey. I simply unpacked this a little further and went into some more details and highlight some of the potential gotchas and setting up things in more detail with specific focus on the [Azure Portal](https://portal.azure.com).

### Deployment

The deployment is nice and easy thanks to a one-click deploy - thanks again [Andrew Matveychuk](https://andrewmatveychuk.com/about/).  

![Deployment Start](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/deploymentsample.png?raw=true)  

![Deployment In Progress](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/deploymentSequence.png?raw=true)  

![Deployment Complete](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/deplolymentComplete.png?raw=true)  

It __"deploys"__ pretty quickly but, of course, this is just the start of the work.

### During deployment  

During the deployment of the application you will see the Web App change.

![Initial Web App](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/initialWebApp.png?raw=true)  

Almost
![New App being deployed](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/ghostBeingConfigured.png?raw=true)

Success!!!  
You will see something **SIMILAR** to this.
![New App deployed](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/ghostConfigured.png?raw=true)

### Gotcha with Container Deployment

The solution takes a while to deploy - this seems to be due to some changes made recently by Docker. Do **NOT** be hasty like I was, this can cause issues and create the need for a re-deploy. Instead lets use the logs to see what is going on :)  
Now let's find the log I was talking about.
![Docker Logs](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/containerLogs.png?raw=true)
We are waiting for **this** entry
![Magic Moment](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/magicMoment-PATIENCE.png?raw=true)

So, now to add move value, we can add an [Azure CDN](https://docs.microsoft.com/en-us/azure/cdn/cdn-overview) (in this case, this has already been done) and look at configuring your own custom name for this.

**A content delivery network (CDN) is a distributed network of servers that can efficiently deliver web content to users. CDNs' store cached content on edge servers in point-of-presence (POP) locations that are close to end users, to minimize latency.**

So we can add a custom domain to a CDN to make this more pretty and give your site a more more friendly name - you can move away from the <https://xyz.azurewebsites.net>, I definitely think a custom domain is far cleaner and "more professional". So let's dive in and get this done. :)

So, there a few steps to get this done. This is well documented [here](https://docs.microsoft.com/en-us/azure/cdn/cdn-map-content-to-custom-domain?tabs=azure-dns), however I will provide more context and give some sample screenshots.

We have some DNS Settings to configure as per the above article. Below, I have added some sample for the [CDN demo](https://demoghost.fskelly.com/) I configure for this blog.  

1. Create the required verification entries in your DNS Zone. I use [ClouDNS](https://www.cloudns.net/) but the process is the same, just how you create the required entries will vary with each provider.
![Required Verification Entries](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/cdnVerification.png?raw=true)
This process should not take too long, but now we want a **certificate** and the joys of TLS  
2. Start the verification process ![Start of Process](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/cdnCert1.png?raw=true)
3. Domain Verification ![Domain Validation](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/cdnCert2.png?raw=true)
4. Create a certificate ![certificate provisioning](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/cdnCert3.png?raw=true)
5. And completed ![process complete](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/cdnCert4.png?raw=true)

Now here is the [end result](https://demoghost.fskelly.com) - note the HTTPS 👍 ![site with HTTPS Cert](https://github.com/fskelly/flkelly-cloudblog/blob/main/static/images/blogImages/2021/ghostblogpost/cdnDemoPost.png?raw=true)
