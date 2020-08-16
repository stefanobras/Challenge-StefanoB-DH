const express = require('express');
const router = express.Router();

const indexController = require('../controllers/indexController');

const initialLoginMiddleware = require('../middlewares/initalLog');

/* GET home page. */
router.get('/', initialLoginMiddleware, indexController.load);

router.get('/search', indexController.search);



module.exports = router;
