const express = require('express');
const router = express.Router();

const validator = require('../middlewares/validator');
const authMiddleware = require('../middlewares/auth');

const productsController = require('../controllers/productsController');

////////////////////////////////

router.get('/:id', productsController.detail);

router.get('/create', productsController.create);
router.post('/create', productsController.store);

router.get('/edit/:productId', productsController.edit);
router.post('/edit/:productId', productsController.update);

router.delete('/delete/:id', productsController.destroy);


module.exports = router;

