const express = require('express');
const router = express.Router();

const categoryController = require('../controllers/categoryController');

router.get('/:id', categoryController.root);

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('category', { title: 'Express' });
});

module.exports = router;