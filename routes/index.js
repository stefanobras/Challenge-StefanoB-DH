const express = require('express');
const router = express.Router();

const validator = require('../middlewares/validator');
const indexController = require('../controllers/indexController');
let usersController = require('../controllers/usersController');

const initialLoginMiddleware = require('../middlewares/initalLog');
const authMiddleware = require('../middlewares/auth');

/* GET home page. */
router.get('/', initialLoginMiddleware, indexController.load);
router.get('/search', indexController.search);

router.post('/logout', authMiddleware, usersController.logout);
router.post('/addtocart', authMiddleware, validator.addToCart, usersController.addToCart);



module.exports = router;
