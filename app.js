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
var app = express();
var fs = require('fs');
var buf = new Buffer(1024);
var spawn = require('child_process').spawn;
// HTTP Headers.
app.use(function (req, res, next) {
    //Enabling CORS 
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Methods", "GET, HEAD, OPTIONS, POST, PUT, DELETE");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, contentType, Content-Type, Accept, Authorization");
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
app.use(cookieParser());
app.set('json spaces', 2);

// set a cookie
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
app.get('/data', getIndexPage);
app.get('/formdata', formDataPage);

let options = {
  maxAge: 1000 * 60 * 15, // would expire after 15 minutes
  httpOnly: true, // The cookie only accessible by the web server
  signed: true // Indicates if the cookie should be signed
}

// POST method route
app.post('/', function (req, res, next) {
  var cookie = req.cookies.cookieName;
  var sql = "";
  var default_query = req.body.Query_name + " select count(*) from Employee; ";
  var connection = mysql.createConnection({
        host: req.body.Host_Name === "" ? req.cookies['host'] : req.body.Host_Name,
        port: 3306,
        user     : req.body.User_Name === "" ? req.cookies['user'] : req.body.User_Name,
        password : req.body.User_Password === "" ? req.cookies['password'] : req.body.User_Password,
        database : req.body.Database_Name === "" ? req.cookies['database'] : req.body.Database_Name,
        insecureAuth: true,
        multipleStatements: true
    });
    sql = req.body.Query_name === "" ? req.cookies['query'] : default_query;
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
      res.cookie('SetCookieDone', req.body.Remember_Login, { maxAge: 900000, httpOnly: true });
      res.cookie('host', req.body.Host_Name || req.cookies['host'], { maxAge: 900000, httpOnly: true });
      res.cookie('user', req.body.User_Name || req.cookies['user'], { maxAge: 900000, httpOnly: true });
      res.cookie('password', req.body.User_Password || req.cookies['password'], { maxAge: 900000, httpOnly: true });
      res.cookie('database', req.body.Database_Name || req.cookies['database'], { maxAge: 900000, httpOnly: true });
      res.cookie('query', sql, { maxAge: 900000, httpOnly: true });
    } else {}
      res.locals.check = req.body.Remember_Login;
      res.locals.query = req.body.Query_name;
      res.locals.data = result;
      res.locals.success = "Query Executed Sucessfully !"; 
      res.render('index');
    }
   });
    connection.end();
});

// POST Data
app.post('/formdata', function (req, res, next) {
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
        host: req.cookies['host'] === "" ? "127.0.0.1" : req.cookies['host'],
        port: 3306,
        user     : req.cookies['user'] === "" ? "root" : req.cookies['user'],
        password : req.cookies['password'] === "" ? "sumit" : req.cookies['password'],
        database : req.cookies['database'] === "" ? "employee_info" : req.cookies['database'],
        insecureAuth: true,
        multipleStatements: true
    });
    connection.query(res.locals.form_query, function(err, result){
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
      res.locals.form_data = insertSQL + " " + dependentSQL + " " + WorksOnSQL;
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