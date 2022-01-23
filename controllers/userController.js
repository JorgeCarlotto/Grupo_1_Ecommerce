const db = require('../src/database/models');
const bcrypt = require("bcryptjs");
const { validationResult } = require("express-validator");

let userController = {
  register: function (req, res) {
    res.render("user/register");
  },
  createProcess: async function (req, res) {
    const resultValidation = validationResult(req);

    if (resultValidation.errors.length > 0) {
      return res.render("user/register", {
        errors: resultValidation.mapped(),
        oldData: req.body,
      });
    } else {
      const userDb = await db.Users.findOne({ where: { email: req.body.email } })
      if (userDb) {
        return res.render("user/register", {
          errors: {
            email: { msg: "Este email ya se encuentra registrado" },
          },
        })
      } else {

        const { email, password } = req.body;
        let passwordEncry = bcrypt.hashSync(password, 10);

        db.Users.create({
          email,
          password: passwordEncry,
          admin: 0,
        })
          .then(function () { res.redirect("/"); })
          .catch((err) => console.log(err));
      }
    }
  },
  login: function (req, res) {
    res.render("user/login");
  },
  loginProcess: async function (req, res) {
    const { email, password } = req.body;

    const userToLogin = await db.Users.findOne({ where: { email: email } })
    const passwordOk = bcrypt.compareSync(password, userToLogin.password);

    if (passwordOk) {
      delete userToLogin.password;
      req.session.userLogged = userToLogin;
      if (req.body.recordUser) {
        res.cookie("userEmail", req.body.email, {
          maxAge: 1000 * 60 * 60,
        });
      }
      return res.redirect("/");
    } else {
      return res.render("user/login", {
        errors: { password: { msg: "Datos incorrectos" } }
      })
    }
  },
  create: function (req, res) {
    res.render("admin/user/create");
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
};
module.exports = userController;
