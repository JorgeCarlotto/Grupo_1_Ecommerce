const express = require('express');
const router = express.Router();

//Controlador
const categoryController = require('../controllers/categoryController');

//Panel de administracion
router.get('/categories', categoryController.list);

module.exports = router;