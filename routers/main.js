const express = require('express');
const router = express.Router();


//controler
const mainController = require('../controllers/mainController.js');



router.get('/', mainController.index);

// formulario comentarios
router.post('/',mainController.comment);


router.get('/error',mainController.error404);

module.exports = router;