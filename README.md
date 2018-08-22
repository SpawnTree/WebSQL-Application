# WebSQL-Application

A web application to run online queries to SQL server (on blockchain possible). Please fork repository and run it. Node.js required. MySQL/MSSQL like application should be running. This loads the result via secured connection on ```XMLHttpRequest```. Data used frequently is cached in to cookies in encrypted form ```depends on user preference```. Loading and Rendering is handled by ```express``` along with ```proper xhr request```. An active internet connection is required for loading data over ```cdn networks```. Just ```download as zip``` or ```git pull``` repository. An ```SSL/TLS``` layer is used for ```HTTPS``` connection in the web application. Trust the ```SSL certificate``` in your browser settings. 

### Commands.

```bash
$ sudo npm install
$ set DEBUG=webserver:*,express* && npm start 
```
Open ```https://localhost:3000```.

![alt-tag](https://raw.githubusercontent.com/SpawnTree/IPFS-SQL-Fork/master/Full-Version.JPG)

![alt-tag](https://raw.githubusercontent.com/SpawnTree/IPFS-SQL-Fork/master/Updated.JPG)

![alt-tag](https://raw.githubusercontent.com/SpawnTree/IPFS-SQL-Fork/master/result.JPG)
