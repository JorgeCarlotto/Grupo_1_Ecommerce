const express = require('express');
const router = express.Router();

//Controlador
const adminController = require('../controllers/adminController');

//Panel de administracion
router.get('/admin', adminController.admin);
router.get('/admin/products', adminController.adminProducts);

module.exports = router;