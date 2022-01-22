const express = require('express');
const router = express.Router();

const {
    body
} = require('express-validator');

const validationUpdateCompany = [
    body('name').notEmpty().withMessage('El campo nombre no debe estar vacío'),
    body('phone').notEmpty().withMessage('El campo telefono no debe estar vacío'),
    body('cuit').notEmpty().withMessage('El campo cuit no debe estar vacío'),
    body('email')
    .notEmpty().withMessage('El campo email no debe estar vacío').bail()
    .isEmail().withMessage('El campo email debe ser un email valido')
];

//Controlador
const adminController = require('../controllers/adminController');

//Administracion de empresa
router.get('/admin/company', adminController.companyShow);
router.get('/admin/company/edit', adminController.companyEdit);
router.put('/admin/company/1/edit', validationUpdateCompany, adminController.companyUpdate);

module.exports = router;