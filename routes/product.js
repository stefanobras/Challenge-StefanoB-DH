const express = require('express');
const router = express.Router();

const productsController = require('../controllers/productsController');

router.get('/detail/:productId/', productsController.detail);

router.get('/create', productsController.create);
router.post('/create', productsController.store);

router.get('/edit/:productId', productsController.edit);
router.post('/edit/:productId', productsController.update);

router.delete('/delete/:id', productsController.destroy);
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('product', { title: 'Express' });
});

module.exports = router;

