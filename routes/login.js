const express = require('express');
const router = express.Router();

const validator = require('../middlewares/validator');
const guestMiddleware = require('../middlewares/guest');
const authMiddleware = require('../middlewares/auth');
const loginMiddleware = require('../middlewares/initalLog');


let usersController = require('../controllers/usersController');


/* GET home page. */
router.get('/', guestMiddleware, usersController.login);

router.post('/', guestMiddleware, validator.login, usersController.processLogin);
router.post('/logout', authMiddleware, usersController.logout);
router.post('/addtocart', authMiddleware, validator.addToCart, usersController.addToCart);
router.post('/deleteFromCart', authMiddleware, usersController.deleteFromCart);
router.post('/shop', authMiddleware, usersController.shop);

module.exports = router;