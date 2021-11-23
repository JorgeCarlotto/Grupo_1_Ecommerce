const express = require('express');
const router = express.Router();

//Controlador
const mainController = require('../controllers/mainController.js');

//Rutas
router.get('/', mainController.index);
router.post('/', mainController.comment);
router.get('/error', mainController.error404);

//Panel de administracion
router.get('/admin', mainController.admin);
router.get('/admin/products', mainController.adminProducts);

module.exports = router;