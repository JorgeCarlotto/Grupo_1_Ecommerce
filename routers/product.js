let express = require('express');
let productController = require('../controllers/productController.js');

let router = express.Router();

router.get('/:id', productController.index);
router.get('/productCart', productController.product_car);
router.get('/creacionProducto', productController.creacion_producto);
router.get('/edicionProducto', productController.edicion_producto);

module.exports = router;