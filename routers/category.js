const express = require('express');
const router = express.Router();

const {body} = require('express-validator');

const validation = [
    body('name').notEmpty().withMessage('El campo nombre no debe estar vacío')
];

//Controlador
const categoryController = require('../controllers/categoryController');

//Panel de administracion
router.get('/admin/categories', categoryController.list);
router.get('/admin/categories/create', categoryController.create);
router.post('/admin/categories/create', validation ,categoryController.store);
router.get('/admin/categories/:id/edit', categoryController.edit);
router.put('/admin/categories/:id/edit', categoryController.update);
router.get('/admin/categories/:id/delete', categoryController.delete);
router.delete('/admin/categories/:id/delete', categoryController.destroy);

module.exports = router;