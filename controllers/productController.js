const db = require('../src/database/models');
const { render } = require('ejs');
const { validationResult } = require('express-validator');
const { restart } = require('nodemon');

let productController = {
    list: function (req, res) {
        db.Product
            .findAll({
                include: [{
                    association: 'category'
                },
                {
                    association: 'flavors'
                }
                ]
            })
            .then(products => res.render('admin/product/list', {
                products
            }))
            .catch(error => {

                res.send(error)
            })
    },
    create: function (req, res) {
        Promise.all([
            db.Category.findAll(),
            db.Flavor.findAll(),
        ])
            .then(function ([categories, flavors]) {
                res.render('admin/product/create', { categories, flavors })
            })

            .catch((error) => {
                res.send(error)
            })
    },
    store: function (req, res) {

        const validation = validationResult(req);
        const { name, category_id, price, description, stock, flavor_id, img } = req.body;

        if (validation.errors.length > 0) {
            Promise.all([
                db.Category.findAll(),
                db.Flavor.findAll(),
            ])
                .then(function ([categories, flavors]) {
                    console.log(req.body)
                    res.render('admin/product/create', {
                        errors: validation.mapped(),
                        oldData: req.body,
                        categories,
                        flavors
                    })
                })
        } else {
            let status = true;
            if (stock <= 0) {
                status = false;
            } else {
                status = true;
            }
            return db.Product
                .create({ name, category_id, price, description, stock, flavor_id, img, status })
                .then(() => res.redirect('/admin/products'));
        }
    },
    edit: function (req, res) {
        Promise.all([
            db.Category.findAll(),
            db.Flavor.findAll(),
            db.Product.findByPk(req.params.id)
        ])
            .then(function ([categories, flavors, product]) {
                res.render('admin/product/edit', {
                    categories,
                    flavors,
                    product
                })
            })

    },
    update: function (req, res) {
        const validation = validationResult(req)
        const { name, category_id, price, description, stock, flavor_id, img, status } = req.body;
        const { id } = req.params

        if (validation.errors.length > 0) {
            Promise.all([
                db.Category.findAll(),
                db.Flavor.findAll(),
                db.Product.findByPk(id)
            ])

                .then(function ([categories, flavors, product]) {
                    res.render('admin/product/edit', {
                        errors: validation.mapped(),
                        oldData: req.body,
                        categories,
                        flavors,
                        product
                    })
                })

        } else {
            let status = true;
            if (stock <= 0) {
                status = false;
            } else {
                status = true;
            }
            db.Product
                .update({ name, category_id, price, description, stock, flavor_id, img, status }, {
                    where: { id: productId }
                })
                .then(() => res.redirect('/admin/products'))

        }
    },
    show: function (req, res) {
        db.Product.findByPk(req.params.id, {
            include: [{
                association: 'category'
            }]
        })
            .then(product => {
                res.render('product/show', {
                    product
                })
            })
    },

    shoppingCart: function (req, res) {
        res.render('product/shoppingCart')
    },
    delete: function (req, res) {
        db.Product
            .findByPk(req.params.id)
            .then(product => res.render('admin/product/delete', {
                product
            }));
    },
    destroy: (req, res) => {
        const { id } = req.params;
        db.Product
            .destroy({
                where: { id }, force: true
            })
            .then(() => {
                return res.redirect('/admin/products')
            })
            .catch(error => res.send(error))

    },
    search: (req, res) => {
        let productoBuscado = req.query.search;

        db.Product.findAll({
            where: {
                name: {
                    [Op.like]: '%' + productoBuscado + '%'
                }
            }
        })
            .then(products => {
                console.log(products)
                res.render('product/findProducts', {
                    products
                })
            })
            .catch(error => res.send(error))
    }
}
module.exports = productController;