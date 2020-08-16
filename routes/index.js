const express = require('express');
const router = express.Router();

const indexController = require('../controllers/indexController');
let usersController = require('../controllers/usersController');

const initialLoginMiddleware = require('../middlewares/initalLog');
const authMiddleware = require('../middlewares/auth');

/* GET home page. */
router.get('/', initialLoginMiddleware, indexController.load);
router.get('/search', indexController.search);

router.post('/logout', authMiddleware, usersController.logout);



module.exports = router;
