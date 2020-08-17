const express = require('express');
const router = express.Router();

const validator = require('../middlewares/validator');

const categoryController = require('../controllers/categoryController');
let usersController = require('../controllers/usersController');

const authMiddleware = require('../middlewares/auth');

router.get('/:id', categoryController.detail);

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('category', { title: 'Express' });
});

router.post('/logout', authMiddleware, usersController.logout);
router.post('/addtocart', authMiddleware, validator.addToCart, usersController.addToCart);
router.post('/deleteFromCart', authMiddleware, usersController.deleteFromCart);
router.post('/shop', authMiddleware, usersController.shop);

module.exports = router;