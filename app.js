var createError = require('http-errors');
var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var logger = require('morgan');
var getIndexPage = require('./routes/index');
var formDataPage = require('./routes/formdata');
var mysql = require('mysql');
var randomstring = require("randomstring");
var app = express();
var fs = require('fs');

// Encrypt cookies while setting. Decrypt cookies while using.
const Cryptr = require('cryptr');
var SecretKey = randomstring.generate({  length: 20 ,  charset: 'alphabetic' });
const cryptr = new Cryptr(SecretKey);


// HTTP Headers.
app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Credentials", "true");
    res.header("Access-Control-Max-Age", "600");
    res.header("X-XSS-Protection", "1; mode=block");
    res.header("Access-Control-Allow-Methods", "GET, HEAD, OPTIONS, POST, PUT, DELETE");
    res.header("Access-Control-Allow-Headers", "Origin, X-PINGOTHER, X-Requested-With, contentType, Content-Type, Accept, Authorization");
    res.header("Access-Control-Request-Headers", "Origin, X-PINGOTHER, X-Requested-With, contentType, Content-Type, Accept, Authorization");
    res.header("Access-Control-Request-Method", "POST");
    res.header("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36");
    res.header("X-Requested-With","XMLHttpRequest");
    res.header("Access-Control-Max-Age","86400");
    res.header("statusText","Headers OK");
    res.header("Cache-Control","private");
    res.header("X-Powered-By","Blockchain Server");
    res.header("status", "200");
    next();
});

// view engine setup
app.use(favicon(__dirname + '/public/images/favicon.ico'));
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

let options = {
  maxAge: 1000 * 60 * 60, // would expire after 1 hour.
  httpOnly: true, // The cookie only accessible by the web server
  signed: false // Indicates if the cookie should be signed
}

app.use(cookieParser());
app.set('json spaces', 4); // if JSON Sent

const middlewares = [
	express.static(path.join(__dirname, 'public')),
	express.static(path.join(__dirname, 'ace-builds-master')),
	bodyParser.json(), // support json encoded bodies
	bodyParser.urlencoded({ extended: true }) // support encoded bodies
]

app.use(middlewares);

// GET method route
app.get('/', getIndexPage);
app.get('/home', getIndexPage);
app.get('/data', formDataPage);
app.get('/formdata', formDataPage);

//AJAX Typehead {experimental} & XMLHttpRequest
app.get('/search',function(req,res){
  var connection = mysql.createConnection({
      host: "127.0.0.1",
      port: 3306,
      user     : "root",
      password : "sumit",
      database : "employee_info",
      insecureAuth: true,
      multipleStatements: true
  });
  connection.connect();
  connection.query('SELECT Fname From EMPLOYEE Where Fname Like "%'+ req.query.key + '%"', function(err, rows, fields) {
    if(err)
    {
      res.locals.query = sql;
      res.locals.message = err.message;
      res.locals.error = err;
      res.locals.status = err.status === "" ? "50x" : 500;
      res.render('error');
    }
      var data=[];
      for(i = 0; i < rows.length; i++){
        data.push(rows[i].Fname);
      }
      res.send(JSON.stringify(data));
  });
});

// POST method route
app.post('/', function (req, res, next) {
  var cookie = req.cookies.cookieName;
  var sql = "";
  var default_query = req.body.Query_name + " select count(*) from Employee; ";
  var connection = mysql.createConnection({
        host: req.body.Host_Name === "" ? cryptr.decrypt(req.cookies['host']) : req.body.Host_Name,
        port: 3306,
        user     : req.body.User_Name === "" ? cryptr.decrypt(req.cookies['user']) : req.body.User_Name,
        password : req.body.User_Password === "" ? cryptr.decrypt(req.cookies['password']) : req.body.User_Password,
        database : req.body.Database_Name === "" ? cryptr.decrypt(req.cookies['database']) : req.body.Database_Name,
        insecureAuth: true,
        multipleStatements: true
    });
    sql = req.body.Query_name === "" ? cryptr.decrypt(req.cookies['query']) : default_query;
    connection.connect();
    connection.query(sql, function(err, result){
    if(err)
    {
      res.locals.query = sql;
      res.locals.message = err.message;
      res.locals.error = err;
      res.locals.status = err.status === "" ? "50x" : 500;
      res.render('error');
    }
    else{
      if (cookie === undefined && req.body.Remember_Login === "on"){
      res.cookie('SetCookieDone', cryptr.encrypt(req.body.Remember_Login), options);
      res.cookie('host', req.body.Host_Name === "" ? req.cookies['host'] : cryptr.encrypt(req.body.Host_Name), options);
      res.cookie('user', req.body.User_Name === "" ? req.cookies['user'] : cryptr.encrypt(req.body.User_Name), options);
      res.cookie('password', req.body.User_Password === "" ? req.cookies['password'] : cryptr.encrypt(req.body.User_Password), options);
      res.cookie('database', req.body.Database_Name === "" ? req.cookies['database'] : cryptr.encrypt(req.body.Database_Name), options);
      res.cookie('query', cryptr.encrypt(sql), options);
    } else {}
      res.locals.check = req.body.Remember_Login;
      res.locals.query = req.body.Query_name;
      res.locals.data = result;
      res.locals.success = "Query Executed Sucessfully !";
      // res.send(result);
      // res.send(JSON.stringify(result));
      res.render('index');
    }
   });
    connection.end();
});

// POST Data
app.post('/formdata', function (req, res, next) {
  var cookie = req.cookies.cookieName;
  var form_check = "Form is valid.";
  var insertSQL = "Insert Into Employee Values (" + "'" + req.body.First_Name + "', " + "'" + req.body.Middle_init_Name + "', " + "'" +
                                                            req.body.Last_Name + "', " + "'" + req.body.SSN + "', " + "'" + req.body.Emp_Bdate + "', " + "'" + req.body.Address + "', " + "'" +
                                                            req.body.Emp_Gender + "', " + "'" + req.body.Emp_Salary + "', " + "'" + req.body.Super_SSN + "', " + "'" + req.body.Dept_number + "'" + ");" ;
  var dependentSQL = "Insert Into Dependent Values (" + "'" + req.body.SSN + "', " + "'" + req.body.Dependent_name + "', " + "'" + req.body.Dependent_Gender + "', " + "'" + req.body.Dependent_Bdate
                                                              + "', " + "'" + req.body.Relationship + "'" + ");";
  var WorksOnSQL = "Insert Into WORKS_ON Values (" + "'" + req.body.SSN + "', " + "'" + req.body.Project_Number + "', " + "'" + req.body.Project_Manhours + "'" + ");";
  res.locals.form_check = form_check;
  res.locals.form_query = insertSQL + " " + dependentSQL + " " + WorksOnSQL;
  res.locals.form_data = insertSQL + " " + dependentSQL + " " + WorksOnSQL;
  res.locals.form_success = "Data Submitted Sucessfully.";
    var connection = mysql.createConnection({
        host: "127.0.0.1",
        port: 3306,
        user     : "root",
        password : "sumit",
        database : "employee_info",
        insecureAuth: true,
        multipleStatements: true
    });
    connection.connect();
    connection.query(res.locals.form_query, function(err, result){
    	if (cookie === undefined){
      		res.cookie('SetCookieDone', cryptr.encrypt("on"), options);
      		res.cookie('host', cryptr.encrypt("127.0.0.1") || cryptr.encrypt(req.cookies['host']), options);
      		res.cookie('user', cryptr.encrypt("root") || cryptr.encrypt(req.cookies['user']), options);
      		res.cookie('password', cryptr.encrypt("sumit") || cryptr.encrypt(req.cookies['password']), options);
      		res.cookie('database', cryptr.encrypt("employee_info") || cryptr.encrypt(req.cookies['database']), options);
    }
    if(err)
    {
      res.locals.query = res.locals.form_query;
      res.locals.message = err.message;
      res.locals.error = err;
      res.locals.status = err.status === "" ? "50x" : 500;
      res.render('error');
    }
    else{
      res.locals.form_check = form_check;
      res.locals.form_query = insertSQL + " " + dependentSQL + " " + WorksOnSQL;
      res.locals.form_data = cryptr.encrypt(insertSQL + " " + dependentSQL + " " + WorksOnSQL);
      res.locals.form_success = "Data Submitted Sucessfully.";
      res.render('formdata');
    }
   });
    connection.end();
});

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  res.locals.query = "Page is not Found";
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  res.locals.query = "Some error occured. It is not a problem with the web application, your data caused error. Please check error details below.";
  res.locals.message = err.message;
  res.locals.error = err;
  res.locals.status = err.status === "" ? "50x" : 500;
  res.render('error');
});

module.exports = app;
