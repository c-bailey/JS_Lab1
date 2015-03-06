var path = require('path');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var mongoose = require('mongoose');
var express = require('express');
var exphbs = require('express-handlebars');
var riot = require('riot');

var index = require('./routes/index');
var article = require('./routes/article.js');
var app = express();

var mongoURI = process.env.MONGOURI || "mongodb://localhost/test";
mongoose.connect(mongoURI);
var PORT = process.env.PORT || 3000;

app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', index.home);
app.get('/article', article);

app.listen(PORT, function() {
  console.log("Application running on port:", PORT);
});
