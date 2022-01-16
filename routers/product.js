//Require
let express = require('express');
let productController = require('../controllers/productController.js');
const path = require('path');
const multer = require('multer');
const router = express.Router();
const { body } = require('express-validator');

const validationStoreUpdate = [
    body('name').notEmpty().withMessage('Ingresa un nombre'),
    body('price').notEmpty().withMessage('Debes poner el precio'),
    body('stock').notEmpty().withMessage('Debes poner stock'),
    body('category_id').notEmpty().withMessage('Debes elegir una categoria'),
    body('flavor_id').notEmpty().withMessage('Debes elegir un gusto'),
    body('description').notEmpty().withMessage('Debes poner una descripción')
];

//Config multer
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, path.join(__dirname, '../public/img/products'))
    },
    filename: function (req, file, cb) {
        const newFileName = 'product-' + Date.now() + path.extname(file.originalname);
        cb(null, newFileName)
    }
})

const upload = multer({
    storage: storage
})

//Panel de administracion
router.get('/admin/products', productController.list);
router.get('/admin/products/create', productController.create);
router.post('/admin/products/create', validationStoreUpdate ,productController.store);
router.get('/admin/products/:id/edit', productController.edit);
router.put('/admin/products/:id/edit',validationStoreUpdate, productController.update)

router.delete('/show/:id', productController.destroy);
router.get('/show/:id', productController.show);

// router.post('/edit/:id', productController.update);
//buscar
router.get('/search', productController.search)

//Routes ShoppingCar
router.get('/shoppingCart', productController.shoppingCart);

module.exports = router;