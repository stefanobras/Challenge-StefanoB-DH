const express = require('express');
const router = express.Router();
const path = require('path');

/* GET users listing. */
const usersController = require('../controllers/usersController');

router.get('/register', usersController.register);
router.post('/register', usersController.processRegister);

module.exports = router;
