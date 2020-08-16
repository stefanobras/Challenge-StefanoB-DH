var express = require('express');
var router = express.Router();

const authMiddleware = require('../middlewares/auth');
let usersController = require('../controllers/usersController');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('cart', { title: 'Express' });
});

module.exports = router;