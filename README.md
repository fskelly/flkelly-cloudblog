# Purpose

This is the backend for my Cloud based blog  
[Fletcher's Cloud Blog](https://cloud.fskelly.com)

My build command

```bash
C:\ProgramData\chocolatey\lib\hugo-extended\tools\hugo.exe
```

## Create a new post

I like to create my content based upon year  
My folder structure looks like this  

```bash
content  
|---post
    |---year
        |---postTitle
            |---index.md
```

```bash
hugo new post/{{year}}/{{postTitle}}/index.md
```

```bash
hugo new post/{{year}}/{{postTitle}}.md
```

![blog](https://img.shields.io/website-up-down-green-red/https/cloud.fskelly.com.svg)  
![Publish Blog](https://github.com/fskelly/flkelly-cloudblog/actions/workflows/azure-static-web-apps-lively-field-0f34d4403.yml/badge.svg)  
![Website maintained](https://img.shields.io/maintenance/yes/2021?style=plastic)
