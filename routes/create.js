var express = require('express');
var router = express.Router();
const multer = require('multer');
const path = require('path');

const validator = require('../middlewares/validator');
const adminMiddleware = require('../middlewares/admin');

let usersController = require('../controllers/usersController');
let productsController = require('../controllers/productsController');

/////////////////////

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
       cb(null, path.resolve(__dirname, '../public/images'))
    },
    filename: function (req, file, cb) {
       cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
 })
 
 var upload = multer({
    storage,
 
    // Validate image
    fileFilter: (req, file, cb) => {
 
       const acceptedExtensions = ['.jpg', '.jpeg', '.png'];
 
       const ext = path.extname(file.originalname);
       
       if (!acceptedExtensions.includes(ext)) {
          req.file = file;
       }
 
       cb(null, acceptedExtensions.includes(ext));
    }
 });

/////////////////////
router.get('/', adminMiddleware, usersController.create);

router.post('/', adminMiddleware, upload.single('image'), validator.createProduct, productsController.store);

module.exports = router;