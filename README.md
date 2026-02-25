# sly-pkg

自定义组件库

## Verdaccio简介

一个基于 Node.js 的轻量级私有仓库

npm publish 上传的仓库默认地址是 npm

通过 Verdaccio 工具可以在本地新建一个仓库地址，上传的包会存储在本地仓库中，其他项目可以通过该仓库地址下载使用。

## 环境准备

### npm

```bash
npm who am i # 查看当前用户
npm config list # 查看源地址
npm set registry url https://registry.npmjs.org/ # 切换源地址
npm config rm registry # 删除源地址
npm login # 登录
npm publish # 发布
npm unpublish 包名 # 撤销发布
```

### nrm

npm install -g nrm

```bash
nrm ls # 查看源地址
nrm add registry url # 添加源地址
nrm use registry # 切换源地址
nrm current # 查看当前源地址
nrm del registry # 删除源地址
```

### PM2

PM2 是一个守护进程管理工具，帮助您管理和守护您的应用程序。它以简单直观的 C​​LI 命令行方式进行工作。

npm install pm2@latest -g

```bash
pm2 ls #查看进程
pm2 start [app.js] # 启动某个应用
pm2 stop [appName/ID] # 停止某个应用(进程名/ID)
pm2 restart [app.js] # 重启某个应用
pm2 describe [appName] # 查看某个进程的具体情况
pm2 logs [appName/ID] # 查看应用日志(进程名/ID)
pm2 delete [appName/ID] # 删除进程(进程名/ID)
pm2 stop all # 停止所有应用
pm2 restart all # 重启所有应用
pm2 logs # 查看实时日志
pm2 logs all # 查看所有日志
pm2 delete all # 删除所有进程
```

> 通过 PM2 启动 Verdaccio

```bash
# 以管理员身份打开 cmd
# 1.直接执行，启动失败
pm2 start verdaccio

# 2.输出日志，查看报错信息
pm2 logs

# 3.正确的 pm2 执行应该拼上 verdaccio 包所在的路径
# D:\Nvm\v16.17.0\node_global\node_modules\verdaccio\bin\verdaccio
pm2 start D:\Nvm\v16.17.0\node_global\node_modules\verdaccio\bin\verdaccio

```

### Verdaccio

npm install -g verdaccio

```bash
# 直接使用 verdaccio 命令运行 (不建议)
verdaccio

# 使用 pm2 运行 (建议使用pm2托管)
pm2 start verdaccio

# 查看 verdaccio 服务是否启动成功
# 访问 http://localhost:4873/ 查看是否能正常访问
```

## 配置流程

- 添加私有 npm 源

```bash
# 查看可选源，* 代表正在使用的源
nrm ls
# 添加一个私有 npm 源，'localhost' 为自定义的源地址名称
nrm add localhost http://localhost:4873/
```

- 切换到私有 npm 源

```bash
# 'localhost' 为添加源时定义的源地址名称
nrm use localhost
```

- 添加用户

```bash
# 添加 npm 用户前，需要先启动 verdaccio 服务
npm adduser --registry http://localhost:4873/

```

## 发布包

- 发布包

```bash
# 发布前，需要先登录私有 npm 源
npm login --registry http://localhost:4873/

# 发布包
npm publish --registry http://localhost:4873/
```
