const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const logger = require('morgan');
const cors = require('cors');
const methodOverride = require('method-override');


const app = express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(cookieParser());
app.use(cors());
app.use(logger('dev'));
app.use(methodOverride('_method'));
app.use(session({
  secret : 'comegato',
  resave : false,
  saveUninitialized : true
}));

//app.use(loginMiddleware);

////////////////////////////
const indexRouter = require('./routes/index');
const productsRouter = require('./routes/product');
const categoryRouter = require('./routes/category');
const registerRouter = require('./routes/register');
const loginRouter = require('./routes/login');
const cartRouter = require('./routes/cart');
const checkoutRouter = require('./routes/checkout');
const createRouter = require('./routes/create');
const editRouter = require('./routes/edit');

app.use('/', indexRouter);
app.use('/category', categoryRouter);
app.use('/product', productsRouter);
app.use('/cart', cartRouter);
app.use('/register', registerRouter);
app.use('/login', loginRouter);
app.use('/checkout', checkoutRouter);
app.use('/create', createRouter);
app.use('/edit', editRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
