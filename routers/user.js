let express = require('express');
let userController = require('../controllers/userController');
let router = express.Router();
const multer = require('multer');
const path = require('path');
const {body} = require('express-validator');
const guestMiddleware = require('../middlewares/guestMiddleware');
const authMiddleware = require('../middlewares/authMiddleware')


//configuracion multer //
const storage = multer.diskStorage({
    destination: function(req,file,cb){
        cb(null,'./public/img/users')    
    },
    filename: function (req, file, cb) {
        cb(null,`${file.fieldname}-${Date.now()}${path.extname(file.originalname)}`)
    }
})

const upload = multer({
    storage: storage
})

const validations = [
    // body('name').notEmpty().withMessage('Ingresa tu nombre'),
    // body('lastName').notEmpty().withMessage('Ingresa tu apellido'),
    body('email').notEmpty().withMessage('Ingresa tu email').bail().isEmail().withMessage('Debe introducir un formato de correo valido'),
    // body('tel').notEmpty().withMessage('ingresa tu número de teléfono'),
    // body('address').notEmpty().withMessage('Ingresa tu dirección'),
    body('password').notEmpty().withMessage('ingresa tu contraseña'),
    // body('img').custom((value,{ req }) => {
    //     let file = req.file;
    //     let acceptedExtensions = ['.jpg','.png','.gif']
    //     if(!file){
    //         throw new Error('Sube una foto')
    //     }else{
    //         let fileExtension= path.extname(file.originalname)
    //         if(!acceptedExtensions.includes(fileExtension)){
    //             throw new Error(`Debe ser formato ${acceptedExtensions.join(',')}`)
    //         }
    //     }
       
    //     return true;
    // })
]


router.get('/',userController.index)
//Form register //
/* router.get('/register',guestMiddleware, userController.register); */
router.get('/register',guestMiddleware, userController.register);

router.get('/admin/user/create', userController.create);

// Form login //
router.get('/login',guestMiddleware, userController.login);

// USERLIST //
router.get('/admin/user/list', userController.list); 
// USERLIST detail //
/* router.get('/usersList/:id', userController.detail);  */
//Procesar el login 
 // ******************************************************* pendiente validacion del login
router.post('/login', userController.loginProcess); 

//process register //
 router.post('/register',validations,userController.createProcess);

 router.get('/admin/user/:id/delete', userController.delete);

 router.delete('/admin/user/:id/delete', userController.destroy);

//show user profile //

router.get('/profile/:id/',authMiddleware , userController.profile);

router.get('/logout/', userController.logout)

// router.delete('/profile/:id', userController.destroy)

//create user from adm //

router.get('/admin/user/create',userController.create)
router.post('/admin/user/create',userController.createProcess)



//router edit and update//
//router.get('/edit/:id',userController.edit );

//router.put('/edit/:id', userController.update); //

module.exports = router;