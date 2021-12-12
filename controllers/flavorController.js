const {
    render
} = require('ejs');
const {
    validationResult
} = require('express-validator');
const db = require('../src/database/models');

let flavorController = {
    list: function (req, res) {
        db.Flavor
            .findAll({
                include: [{
                    association: 'products'
                }]
            })
            .then(flavors => res.render('admin/flavor/list', {
                flavors
            }))
    },
    create: function (req, res) {
        res.render('admin/flavor/create');
    },
    edit: function (req, res) {
        db.Flavor
            .findByPk(req.params.id)
            .then(flavor => res.render('admin/flavor/edit', {
                flavor
            }));
    },
    store: function (req, res) {
        const validation = validationResult(req)
        if (validation.errors.length > 0) {
            res.render('admin/flavor/create', {
                errors: validation.mapped(),
                oldData: req.body
            })

        } else {
            db.Flavor
                .create({
                    name: req.body.name
                })
                .then(() => res.redirect('/admin/flavors'))
        };
    },
    update: function (req, res) {
        const validation = validationResult(req);

        if (validation.errors.length > 0) {
            res.render('admin/flavors/edit', {
                errors: validation.mapped(),
                oldData: req.body,
                flavor: {
                    id: req.params.id
                }
            });
        } else {
            db.Flavor
                .update({
                    name: req.body.name
                }, {
                    where: {
                        id: req.params.id
                    }
                })
                .then(() => res.redirect('/admin/flavors'))
        }
    },
    delete: function (req, res) {
        db.Flavor
            .findByPk(req.params.id)
            .then(flavor => res.render('admin/flavor/delete', {
                flavor
            }));
    },
    destroy: function (req, res) {
        db.Flavor
            .destroy({
                where: {
                    id: req.params.id
                }
            })
            .then(() => res.redirect('/admin/flavors'))
    }
};

module.exports = flavorController;