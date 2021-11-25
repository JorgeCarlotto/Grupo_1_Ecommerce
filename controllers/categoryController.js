const {
    render
} = require('ejs');
const db = require('../src/database/models');

let categoryController = {
    list: function (req, res) {
        db.Category
            .findAll()
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
        db.Category
            .create({
                name: req.body.name
            })
            .then(() => res.redirect('/admin/categories'))
    },
    update: function (req, res) {
        db.Category
            .update({
                name: req.body.name
            }, {
                where: {
                    id: req.params.id
                }
            })
            .then(() => res.redirect('/admin/categories'))
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