---
title: 'Debug Node application inside docker using vs code'
excerpt: 'No more `console.log` everywhere on the project and then remove then to commit code!
Also debugging we are able to...'
coverImage: '/assets/blog/debug-node-docker-vscode/cover.jpg'
date: '2020-08-04T23:45:00.000Z'
author:
  name: Álvaro Reis
  picture: '/assets/blog/authors/alvaro.jpeg'
ogImage:
  url: '/assets/blog/dynamic-routing/cover.jpg'
---
## Motivation

No more `console.log` everywhere on the project and then remove then to commit code!
Also debugging we are able to get much more info about what is happening on an specific execution time
In the end of the day, we may investigate better and solve problems faster

## Follow through the code
`git clone git@github.com:reisneto/debug-node-docker-vscode.git`  
[github repository](https://github.com/reisneto/debug-node-docker-vscode)


## Configure VS Code

inside your project create the folder .vscode  
`mkdir .vscode`  
and inside .vscode create launch.json
`launch.json`  
this file will configure how vscode will handle debugging

### launch.json

In order to run the debugger with a docker container, paste the code below inside your launch.json

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "attach",
      "name": "d: Attach to Node",
      "remoteRoot": "/your/docker/workdir/app",
      "localRoot": "${workspaceFolder}/app"
    }
  ]
}
```

**remoteRoot** is your work directory inside docker and **localRoot** your local work directory. Use `${workspaceFolder}` to get the absolute path of your project

### settings.json

Don't ask me why, but when the config below is true our breakpoints don't work! so make sure it false. You can create a settings.json file inside .vscode folder or change it on your vs code settings.

```json
{
  "debug.javascript.usePreview": false
}
```

### Don't use version vs code 1.47!

The whole idea of this post is this: I spent about 2 hours to figure out my vs code version was preventing me to use debugger. Breakpoints were not working because of it, even when I put `debug.javascript.usePreview` to false!

Had to downgrade to [version 1.46](https://code.visualstudio.com/updates/v1_46) to make it work.

### Add inspect

    at package.json add --inspect to your running tool

    "scripts": {
      "dev": "ts-node-dev --inspect=0.0.0.0 -- server.ts"
    },

    or

    "scripts": {
      "dev": "nodemon --inspect=0.0.0.0 server.js"
    },

`--inspect=0.0.0.0` makes it possible to listen inside docker container

### That's it
I suggest to take a look into the code at the repository, any questions you can reach me out at <reisneto.alvaro@gmail.com>

---

special thanks to [this post](https://tjaddison.com/blog/2019/08/styling-markdown-tailwind-gatsby/) which helped me to styling my markdown -> html posts
