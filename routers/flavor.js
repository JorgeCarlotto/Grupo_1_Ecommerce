const express = require('express');
const router = express.Router();

const {
    body
} = require('express-validator');

const validation = [
    body('name').notEmpty().withMessage('El campo nombre no debe estar vacío')
];

//Controlador
const flavorController = require('../controllers/flavorController');

//Panel de administracion
 router.get('/admin/flavors', flavorController.list);
 router.get('/admin/flavors/create', flavorController.create);
 router.post('/admin/flavors/create',validation, flavorController.store);
 router.get('/admin/flavors/:id/edit', flavorController.edit);
 router.put('/admin/flavors/:id/edit', validation, flavorController.update);
// router.get('/admin/categories/:id/delete', categoryController.delete);
// router.delete('/admin/categories/:id/delete', categoryController.destroy);


module.exports = router;