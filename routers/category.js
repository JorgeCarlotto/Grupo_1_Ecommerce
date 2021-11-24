const express = require('express');
const router = express.Router();

//Controlador
const categoryController = require('../controllers/categoryController');

//Panel de administracion
router.get('/admin/categories', categoryController.list);
router.get('/admin/categories/create', categoryController.create);

module.exports = router;