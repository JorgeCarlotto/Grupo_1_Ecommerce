let express = require('express');
let productController = require('../controllers/productController.js');

let router = express.Router();

router.get('/product-details', productController.index);

module.exports = router;