
//Require modols //
/* const  path = require('path');
const fs = require('fs'); */
const bcrypt = require('bcryptjs');
const {validationResult} = require('express-validator')
const User = require('../models/User')


// data base //
/* const usersFilePath = path.join(__dirname, '../data/usuariosDataBase.json');

const users = JSON.parse(fs.readFileSync(usersFilePath, 'utf-8')); */

let userController = {

    index : function (req, res) {
        res.render('user/index', {users : users });
    },
    register: function (req, res) {
        res.render('user/register')
    },
     processRegister: function (req, res) {
        const resultValidation = validationResult(req);
      
       if(resultValidation.errors.length > 0){
           return res.render('user/register',{ errors : resultValidation.mapped(),
            oldData : req.body 
        }) 
    }
        let userInDB = User.findByField('email',req.body.email);
        
        if(userInDB){
            return res.render('user/register',{ 
                errors : {
                email: {
                    msg : 'Este Email ya se encuentra registrado'
                }
            },
                oldData : req.body 
        });
    }
        // Incriptacion de contraseña    
        let userToCreate = {
            ...req.body,
            password : bcrypt.hashSync(req.body.password, 10),
            img: req.file.filename
        }

         let userCreate = User.create(userToCreate)
        
        return res.redirect('users/login')
},
login: function (req, res) {
    
    res.render('user/login')
},
loginProcess: function (req, res) {
    let userToLogin = User.findByField('email', req.body.email);

        if(userToLogin){

            let isOkThePassword = bcrypt.compareSync(req.body.password, userToLogin.password);

            if(isOkThePassword) {
                delete userToLogin.password;
                req.session.userLogged = userToLogin;
                return res.redirect('profile')
        }
        return res.render('user/login',{ 
            errors : {
            email: {
                msg : 'Password invalido'
            }
            }
        });

        }

        return res.render('user/login', {
            errors: {
                email:{
                    msg :'No se encuentra el email en la base de datos'
                }
            }
        })
        
},
profile: function (req, res) {
    /* console.log(req.session.userLogged); */
    console.log("profile")
    console.log(req.session)
    return res.render('user/profile', {
        user : req.session.userLogged
    });
},
logout : function (req, res) {
    req.session.destroy();
    return res.redirect('/');
}

            
     }
        /* let img
         if( req.file != undefined){
           img = req.file.filename;
         }else {
             img  = 'person-default.jpg'
         }
         let ids = users.map(u => u.id);
         let newUser = {
             id: Math.max (...ids) + 1,...req.body,
             img :img   
         };
         users.push(newUser)
         fs.writeFileSync(usersFilePath, JSON.stringify(users, null, ' '));
         res.redirect('/users') */
     /* } */
     /* profile: function (req, res) {
        let user = users.find( user => user.id == req.params.id );
        res.render('user/profile', {
            user : user})
     }, */
     /* destroy : (req, res) => {
		let id = req.params.id;
		let finalUsers = users.filter(user => user.id != id);
		fs.writeFileSync(usersFilePath, JSON.stringify(finalUsers, null, ' '));
		res.redirect('/users/register');
	}, */
      /* dit:(req,res)=> {
        let user = users.find( user => user.id == req.params.id );
        res.render('user/edit', {
            users : users})
      },
      update: (req,res) =>{
        
      } */
   /*  } */
/* console.log(userController.profile()); */
module.exports = userController; 