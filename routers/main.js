let express = require('express');
let mainController = require('../controllers/mainController.js');
let allProductsController = require('../controllers/AllProductsController.js')

let router = express.Router();

router.get('/', mainController.index);
router.get('/register', mainController.register);
router.get('/login', mainController.login);
router.get('/allProducts', allProductsController.productsTodos);
router.get('/error',mainController.error404);

module.exports = router;