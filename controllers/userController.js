
//Require modols //
/* const  path = require('path');
const fs = require('fs'); */
const {validationResult} = require('express-validator')
const User = require('../models/User')
const bcrypt = require('bcryptjs');

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
    login: function (req, res) {
        res.render('user/login')
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

        let userToCreate = {
            ...req.body,
            password : bcrypt.hashSync(req.body.password, 10),
            img: req.file.filename
        }

        User.create(userToCreate)
        // User.create(req.body)
        return res.send("validaciones pasadas sin errores")
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

module.exports = userController; 