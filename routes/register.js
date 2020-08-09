var express = require('express');
var router = express.Router();

const usersController = require('../controllers/usersController');

router.get('/register', usersController.register);
router.post('/register', usersController.processRegister);

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('register', { title: 'Express' });
});

module.exports = router;