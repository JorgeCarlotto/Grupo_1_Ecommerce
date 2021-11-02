let express = require('express');
let userController = require('../controllers/userController');
let router = express.Router();
const multer = require('multer');
const path = require('path');

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
router.get('/',userController.index)
router.get('/register', userController.register);
router.get('/login', userController.login);

/* router.post(/register) */
router.post('/register',upload.single('img'),userController.store);

router.get('/show/:id', userController.show)
router.delete('/show/:id', userController.destroy)

/* router edit and update */
router.get('/edit/:id',userController.edit );
router.put('/edit', userController.update);
;

module.exports = router;