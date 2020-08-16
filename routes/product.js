const express = require('express');
const router = express.Router();

const validator = require('../middlewares/validator');
const authMiddleware = require('../middlewares/auth');

const productsController = require('../controllers/productsController');
let usersController = require('../controllers/usersController');

////////////////////////////////

router.get('/:id', productsController.detail);

router.get('/create', productsController.create);
router.post('/create', productsController.store);

router.get('/edit/:productId', productsController.edit);
router.post('/edit/:productId', productsController.update);
router.post('/logout', authMiddleware, usersController.logout);

router.delete('/delete/:id', productsController.destroy);


module.exports = router;

