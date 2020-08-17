var express = require('express');
var router = express.Router();

const authMiddleware = require('../middlewares/auth');

let usersController = require('../controllers/usersController');


router.get('/', authMiddleware, usersController.cart);


module.exports = router;