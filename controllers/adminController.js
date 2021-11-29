const db = require('../src/database/models');
const sequelize = db.sequelize;
const {
    validationResult
} = require('express-validator');

let mainController = {
    admin: function (req, res) {
        res.render('admin/adminPanel');
    },
    adminProducts: function (req, res) {
        db.Products.findAll()
            .then(productos => console.log(productos));
    },
    companyShow: function (req, res) {
        db.Company
            .findByPk(1)
            .then(company => res.render('admin/company/show', {
                company
            }));
    },
    companyEdit: function (req, res) {
        db.Company
            .findByPk(1)
            .then(company => res.render('admin/company/edit', {
                company
            }));
    },
    companyUpdate: function (req, res) {
        const validation = validationResult(req);

        if (validation.errors.length > 0) {
            res.render('admin/company/edit', {
                errors: validation.mapped(),
                company: req.body
            });
        } else {
            db.Company
                .update({
                    name: req.body.name,
                    phone: req.body.phone,
                    email: req.body.email,
                    cuit: req.body.cuit
                }, {
                    where: {
                        id: 1
                    }
                })
                .then(() => res.redirect('/admin/company'))
        }
    }
};

module.exports = mainController;