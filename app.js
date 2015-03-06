//Chelsea Bailey & Haley Pelletier
//Olin.js LAB1 - Wiki - Riot

//Imports
var express = require('express');
var path = require('path');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var exphbs = require('express-handlebars');
var mongoose = require('mongoose');

var riot = require('riot');

var index = require('./routes/index');
var article = require('./routes/article.js');

//General Set-up
var app = express();
var PORT = process.env.PORT || 3000;
var mongoURI = process.env.MONGOURI || "mongodb://localhost/test";
mongoose.connect(mongoURI);
var db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function (callback) {
  console.log("Connection to MongoDB successful")
});
app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


//Routes
app.get('/', index.home);
app.use('/article', article);


//Listening to the port
app.listen(PORT, function() {
  console.log("Application running on port:", PORT);
});

