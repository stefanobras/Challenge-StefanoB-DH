const express = require('express');
const router = express.Router();

const validator = require('../middlewares/validator');
const authMiddleware = require('../middlewares/auth');

const productsController = require('../controllers/productsController');
let usersController = require('../controllers/usersController');

////////////////////////////////

router.get('/:id', productsController.detail);


router.post('/logout', authMiddleware, usersController.logout);
router.post('/addtocart', authMiddleware, validator.addToCart, usersController.addToCart);
router.post('/deleteFromCart', authMiddleware, usersController.deleteFromCart);


module.exports = router;

