let express = require('express');
let userController = require('../controllers/userController');
let router = express.Router();
const multer = require('multer');
const path = require('path');
const { body } = require('express-validator');
// const guestMiddleware = require('../middlewares/guestMiddleware');
// const authMiddleware = require('../middlewares/authMiddleware')

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
router.get('/admin/user/list', userController.list);
router.get('/admin/user/create', userController.create);
router.get('/admin/user/:id/delete', userController.delete);
router.delete('/admin/user/:id/delete', userController.destroy);
router.get('/admin/user/create', userController.register)
router.post('/admin/user/create', userController.createProcess)
router.get('/admin/user/:id/edit', userController.edit)
router.put('/admin/user/:id/edit', validationUpDate, userController.update)

//Login
router.get('/login', userController.login);
router.post('/login', validations, userController.loginProcess);

//Registro de usuario
router.get('/register', userController.register);
router.post('/register', validations, userController.createProcess);


router.get('/', userController.index)
router.get('/profile/:id/', userController.profile);
router.get('/logout/', userController.logout)

module.exports = router;