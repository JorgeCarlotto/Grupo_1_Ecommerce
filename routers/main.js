const express = require('express');
const router = express.Router();

//Controlador
const mainController = require('../controllers/mainController.js');

//Rutas
router.get('/', mainController.index);
router.get('/error', mainController.error404);

module.exports = router;