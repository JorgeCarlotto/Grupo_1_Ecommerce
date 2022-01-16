//Require modols //
const path = require("path");
const fs = require("fs");
const bcrypt = require("bcryptjs");
const {
  validationResult
} = require("express-validator");
const User = require("../models/User");
const db = require("../src/database/models");
const sequelize = db.sequelize;
const {Op
} = require("sequelize");

// data base //
/* const usersFilePath = path.join(__dirname, '../data/usuariosDataBase.json');

const users = JSON.parse(fs.readFileSync(usersFilePath, 'utf-8')); */

let userController = {
  create: function (req, res) {
    res.render("admin/user/create");
  },

  createProcess: function (req, res) {
    const resultValidation = validationResult(req);

    if (resultValidation.errors.length > 0) {
      return res.render("user/register", {
        errors: resultValidation.mapped(),
        oldData: req.body,
      });
    }

    let userInDB = db.Users.findOne({
        where: {
          email: req.body.email,
        },
      })
      .then((user) => {
        if (user) {
          res.render("user/register", {
            errors: {
              email: {
                msg: "Este Email ya se encuentra registrado",
              },
            },
          });
        }
      })
      .catch((err) => console.log(err));

    let UserPassword = req.body.password;
    let passwordEncry = bcrypt.hashSync(UserPassword, 10);

    db.Users.create({
        email: req.body.email,
        password: passwordEncry,
        admin: 0,
      })
      .then(function () {
        res.redirect("/users/login");
      })
      .catch((err) => console.log(err));
  },

  delete: function (req, res) {
    db.Users.findByPk(req.params.id)
      .then((users) => res.render("admin/user/delete", {
        users
      }))
      .catch((err) => console.log(err));
  },
  destroy: function (req, res) {
    db.Users.destroy({
        where: {
          id: req.params.id,
        },
      })
      .then(() => res.redirect("/users/admin/user/list"))
      .catch((err) => console.log(err));
  },

  list: function (req, res) {
    db.Users.findAll().then(function (users) {
      res.render("admin/user/list", {
        users: users,
      });
    });
  },
  edit: function (req, res) {
    /* console.log(db.Users) */
    db.Users.findByPk(req.params.id)
      .then((users) => res.render("admin/user/edit", {
        users
      }))
      .catch((err) => console.log(err));
  },
  update: function (req, res) {
    const validation = validationResult(req);
    if (validation.errors.length > 0) {
      res.render("admin/user/edit", {
        errors: validation.mapped(),
        oldData: req.body,
        users: {
          id: req.params.id,
        },
      });
    } else {
      db.Users.update({
          email: req.body.email,
        }, {
          where: {
            id: req.params.id,
          },
        })
        .then(() => res.redirect('/users/admin/user/list'))
        .catch((errors) => console.log(console.log(errors)));
    }
  },

  detail: function (req, res) {
    db.Users.findByPk(req.params.id).then(function (user) {
      res.render("userDetail", {
        user: user,
      });
    });
  },

  index: function (req, res) {
    res.render("user/index", {
      user: User.getData(),
    });
  },
  register: function (req, res) {
    res.render("user/register");
  },
  login: function (req, res) {
    res.render("user/login", {
      user: User.getData(),
    });
  },
  loginProcess: function (req, res) {
    let userToLogin = User.findByField("email", req.body.email);

    if (userToLogin) {
      let isOkThePassword = bcrypt.compareSync(
        req.body.password,
        userToLogin.password
      );

      if (isOkThePassword) {
        delete userToLogin.password;
        req.session.userLogged = userToLogin;
        if (req.body.recordUser) {
          res.cookie("userEmail", req.body.email, {
            maxAge: 1000 * 60 * 60,
          });
        }
        return res.redirect(`profile/${userToLogin.id}`);
      }
      return res.render("user/login", {
        errors: {
          email: {
            msg: "Password invalido",
          },
        },
      });
    }

    return res.render("user/login", {
      errors: {
        email: {
          msg: "No se encuentra el email en la base de datos",
        },
      },
    });
  },
  profile: function (req, res) {
    /* console.log(req.session.userLogged); */
    console.log(req.cookies.userEmail);
    return res.render("user/profile", {
      user: req.session.userLogged,
    });
  },
  logout: function (req, res) {
    res.clearCookie("userEmail");
    req.session.destroy();
    return res.redirect("/");
  },
  // destroy: function (req, res) {
  //     res.clearCookie('userEmail')
  //     req.session.destroy();
  //     let id = req.params.id;
  //     let finalUsers = User.getData().filter(user => user.id != id);
  //     fs.writeFileSync(User.fileName, JSON.stringify(finalUsers, null, ' '));
  //     res.redirect('/')
  // },

  //Codigo con Sequelize y BD
};
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