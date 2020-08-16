const express = require('express');
const router = express.Router();

const validator = require('../middlewares/validator');
const guestMiddleware = require('../middlewares/guest');
const authMiddleware = require('../middlewares/auth');
const loginMiddleware = require('../middlewares/initalLog');

let usersController = require('../controllers/usersController');

////////////////////////////////////////////
router.get('/', guestMiddleware, usersController.register);

router.post('/', guestMiddleware, validator.register, usersController.processRegister);


module.exports = router;