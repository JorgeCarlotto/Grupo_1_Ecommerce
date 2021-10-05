let express = require('express');
let mainController = require('../controllers/mainController.js');

let router = express.Router();

router.get('/', mainController.index);
router.get('/register', mainController.register);
router.get('/login', mainController.login);
router.get('/product-car', mainController.product_car);
router.get('/creacionProducto',mainController.creacion_producto);
router.get('/edicionProducto',mainController.edicion_producto);
router.get('/error',mainController.error404);

module.exports = router;