const express = require('express');
const router = express.Router();

let usersController = require('../controllers/usersController');



////////////////////////////////////////////
router.get('/', usersController.register);

router.post('/', usersController.processRegister);



module.exports = router;