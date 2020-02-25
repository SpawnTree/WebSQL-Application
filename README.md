# WebSQL-Application

[![Build Status](https://travis-ci.org/SpawnTree/WebSQL-Application.svg?branch=master)](https://travis-ci.org/SpawnTree/WebSQL-Application)

A demo web application to run online queries to SQL server. It is not secured for the sake of simplicity. This demo must only be used for educatioinal/demonstration purposes only. Dont store sensitive data. The queries are not santized in this demo tutorial. Please fork repository and run it. 

Node.js required. MySQL/MSSQL like application should be running. This loads the result via secured connection on ```XMLHttpRequest```. Data used frequently is cached in to cookies in encrypted form ```depends on user preference```. Loading and Rendering is handled by ```express``` along with ```proper xhr request```. An active internet connection is required for loading data over ```cdn networks```. Just ```download as zip``` or ```git pull``` repository. An ```SSL/TLS``` layer is used for ```HTTPS``` connection in the web application. Trust the ```SSL certificate``` in your browser settings. It is possible to add ```redis``` caching so that connection query requests to ```MySQL``` instance is reduced, but I have not implemented it yet. Please wait for next release.

### Commands.

```bash
$ sudo npm install
$ set DEBUG=webserver:*,express* && npm start
```
Open ```https://localhost:3000/```.

### Installs

Node.js
[Node.js Install](https://nodejs.org/en/download/)

MySQL
[MySQL Install](https://dev.mysql.com/downloads/)

MySQL Windows
[MySQL Windows](https://dev.mysql.com/downloads/windows/)

To use Redis, REDIS
[Redis Install](https://redis.io/download)
