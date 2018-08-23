# WebSQL-Application

A web application to run online queries to SQL server (on blockchain possible). Please fork repository and run it. Node.js required. MySQL/MSSQL like application should be running. This loads the result via secured connection on ```XMLHttpRequest```. Data used frequently is cached in to cookies in encrypted form ```depends on user preference```. Loading and Rendering is handled by ```express``` along with ```proper xhr request```. An active internet connection is required for loading data over ```cdn networks```. Just ```download as zip``` or ```git pull``` repository. An ```SSL/TLS``` layer is used for ```HTTPS``` connection in the web application. Trust the ```SSL certificate``` in your browser settings.

### Commands.

```bash
$ sudo npm install
$ set DEBUG=webserver:*,express* && npm start
```
Open ```https://localhost:3000```.

### Installs

Node.js
[Node.js Install](https://nodejs.org/en/download/)

MySQL
[MySQL Install](https://dev.mysql.com/downloads/)

MySQL Windows
[MySQL Windows](https://dev.mysql.com/downloads/windows/)

### Screenshots.

![alt-tag](https://raw.githubusercontent.com/SpawnTree/IPFS-SQL-Fork/master/Sample/dialog.JPG)

![alt-tag](https://raw.githubusercontent.com/SpawnTree/IPFS-SQL-Fork/master/Sample/Full-Version.JPG)

![alt-tag](https://raw.githubusercontent.com/SpawnTree/IPFS-SQL-Fork/master/Sample/loading.JPG)

![alt-tag](https://raw.githubusercontent.com/SpawnTree/IPFS-SQL-Fork/master/Sample/secure_ssl.JPG)

![alt-tag](https://raw.githubusercontent.com/SpawnTree/IPFS-SQL-Fork/master/Sample/data_entry.JPG)

![alt-tag](https://raw.githubusercontent.com/SpawnTree/IPFS-SQL-Fork/master/Sample/Updated.JPG)

![alt-tag](https://raw.githubusercontent.com/SpawnTree/IPFS-SQL-Fork/master/Sample/result.JPG)
