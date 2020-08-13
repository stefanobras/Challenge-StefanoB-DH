var express = require('express');
var router = express.Router();

let usersController = require('../controllers/usersController');

/* GET home page. */
router.get('/', usersController.login);

router.post('/', usersController.processLogin);

module.exports = router;