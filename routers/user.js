let express = require('express');
let userController = require('../controllers/userController');
let router = express.Router();
const multer = require('multer');
const path = require('path');
const { body } = require('express-validator');

//Reglas de vistas
const authMiddleware = require('../middlewares/authMiddleware')
const adminMiddleware = require('../middlewares/adminMiddleware');

//configuracion multer //
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './public/img/users')
    },
    filename: function (req, file, cb) {
        cb(null, `${file.fieldname}-${Date.now()}${path.extname(file.originalname)}`)
    }
})

const upload = multer({
    storage: storage
})

const validations = [
    body('email')
        .notEmpty().withMessage('Ingresa tu email').bail()
        .isEmail().withMessage('Debe introducir un formato de correo valido'),
    body('password')
        .notEmpty().withMessage('ingresa tu contraseña'),
]

const validationUpDate = [
    body('email').notEmpty().withMessage('Ingresa tu email').bail().isEmail().withMessage('Debe introducir un formato de correo valido'),
]

//Panel admin
router.get('/admin/user/list', authMiddleware, userController.list);
router.get('/admin/user/:id/delete', authMiddleware, adminMiddleware, userController.delete);
router.delete('/admin/user/:id/delete', authMiddleware, adminMiddleware, userController.destroy);
router.get('/admin/user/:id/edit', authMiddleware, adminMiddleware, userController.edit)
router.put('/admin/user/:id/edit', authMiddleware, adminMiddleware, validationUpDate, userController.update)

//Login
router.get('/login', validations, userController.login);
router.post('/login', validations, userController.loginProcess);
router.get('/logout/', userController.logout)

//Registro de usuario
router.get('/register', userController.register);
router.post('/register', validations, userController.createProcess);

// router.get('/profile/:id/', userController.profile);

module.exports = router;