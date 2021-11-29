const {
    render
} = require('ejs');
const {
    validationResult
} = require('express-validator');
const db = require('../src/database/models');

let categoryController = {
    list: function (req, res) {
        db.Category
            .findAll({
                include: [{
                    association: 'products'
                }]
            })
            .then(categories => res.render('admin/category/list', {
                categories
            }))
    },
    create: function (req, res) {
        res.render('admin/category/create');
    },
    edit: function (req, res) {
        db.Category
            .findByPk(req.params.id)
            .then(category => res.render('admin/category/edit', {
                category
            }));
    },
    store: function (req, res) {
        const validation = validationResult(req);

        if (validation.errors.length > 0) {
            res.render('admin/category/create', {
                errors: validation.mapped(),
                oldData: req.body
            });
        } else {
            db.Category
                .create({
                    name: req.body.name
                })
                .then(() => res.redirect('/admin/categories'))
        }
    },
    update: function (req, res) {
        const validation = validationResult(req);

        if (validation.errors.length > 0) {
            res.render('admin/category/edit', {
                errors: validation.mapped(),
                oldData: req.body,
                category: {
                    id: req.params.id
                }
            });
        } else {
            db.Category
                .update({
                    name: req.body.name
                }, {
                    where: {
                        id: req.params.id
                    }
                })
                .then(() => res.redirect('/admin/categories'))
        }
    },
    delete: function (req, res) {
        db.Category
            .findByPk(req.params.id)
            .then(category => res.render('admin/category/delete', {
                category
            }));
    },
    destroy: function (req, res) {
        db.Category
            .destroy({
                where: {
                    id: req.params.id
                }
            })
            .then(() => res.redirect('/admin/categories'))
    }
};

module.exports = categoryController;