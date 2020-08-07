---
title: 'Debug Node application inside docker using vs code'
excerpt: 'Hello world'
coverImage: '/assets/blog/debug-node-docker-vscode/cover.jpg'
date: '2020-08-04T23:45:00.000Z'
author:
  name: Álvaro Reis
  picture: '/assets/blog/authors/alvaro.jpeg'
ogImage:
  url: '/assets/blog/dynamic-routing/cover.jpg'
---

Hello world!

## Agenda
- Motivation
- Creating a sample application
  - node
  - docker
- Configuring VS Code
  - .vscode
  - v1.47 bugged!

## Motivation

## Creating a sample application
## Configuring VS Code
### launch.json
```json
{    
  "version": "0.2.0",
  "configurations": [
      {
          "type": "node",
          "request": "attach",
          "name": "d: Attach to Node",
          "remoteRoot": "/home/node/code/app",
          "localRoot": "${workspaceFolder}/app",            
      },        
  ]
}
```

### settings.json
```json
  {
    "debug.javascript.usePreview": false,
  }
```

special thanks to [this post](https://tjaddison.com/blog/2019/08/styling-markdown-tailwind-gatsby/) which helped me to styling my markdown -> html posts