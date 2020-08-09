const express = require('express');
const router = express.Router();

const indexController = require('../controllers/indexController');

/* GET home page. */
router.get('/', indexController.load);

router.get('/', indexController.root);
router.get('/search', indexController.search);



module.exports = router;
