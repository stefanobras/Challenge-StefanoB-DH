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
router.post('/logout', authMiddleware, usersController.logout);
router.post('/addtocart', authMiddleware, validator.addToCart, usersController.addToCart);
router.post('/deleteFromCart', authMiddleware, usersController.deleteFromCart);

module.exports = router;