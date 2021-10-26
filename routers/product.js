//Require
let express = require('express');
let productController = require('../controllers/productController.js');
const path = require('path');
const multer = require('multer');

let router = express.Router();

//Config multer
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, path.join(__dirname,'../public/img/products'))
    },
    filename: function (req, file, cb) {
        const newFileName = 'product-' + Date.now() + path.extname(file.originalname);
        cb(null, newFileName)
    }
})

const upload = multer({
    storage: storage
})

router.get('/', productController.index);

//Routes CRUD
router.get('/create', productController.create);
router.post('/create',upload.single('img') ,productController.store);
router.get('/show/:id', productController.show);
router.delete('/show/:id', productController.destroy);
router.get('/edit/:id', productController.edit);
router.put('/edit/:id/update', productController.update);

//Routes ShoppingCar
router.get('/shoppingCart', productController.shoppingCart);

module.exports = router;