let express = require('express');
let productController = require('../controllers/productController.js');

let router = express.Router();

router.get('/', productController.index);
//Routes CRUD
router.get('/create', productController.create);
router.get('/show/:id', productController.show);
router.get('/edit/:id', productController.edit);
router.put('/edit/:id/update', productController.update);
router.delete('/:id/delete', productController.delete);

//Routes ShoppingCar
router.get('/shoppingCart', productController.shoppingCart);

module.exports = router;