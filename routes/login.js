const express = require('express');
const router = express.Router();

const validator = require('../middlewares/validator');
const guestMiddleware = require('../middlewares/guest');
const authMiddleware = require('../middlewares/auth');


let usersController = require('../controllers/usersController');


/* GET home page. */
router.get('/', guestMiddleware, usersController.login);

router.post('/', guestMiddleware, validator.login, usersController.processLogin);

module.exports = router;