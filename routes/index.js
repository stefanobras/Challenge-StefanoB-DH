const express = require('express');
const router = express.Router();

const indexController = require('../controllers/indexController');

const loginMiddleware = require('../middlewares/log');

/* GET home page. */
router.get('/', indexController.load);

router.get('/search', indexController.search);



module.exports = router;
