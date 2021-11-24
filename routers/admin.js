const express = require('express');
const router = express.Router();

//Controlador
const adminController = require('../controllers/adminController');

//Panel de administracion
router.get('/', adminController.admin);
router.get('/products', adminController.adminProducts);

module.exports = router;