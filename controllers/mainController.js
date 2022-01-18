const db = require('../src/database/models');
const path = require('path');
const fs = require('fs');

let mainController = {
    index: function (req, res) {
        db.Product
            .findAll({ order: [['id', 'DESC']], limit: 6 })
            .then(products => res.render('main/index', { products }))
            .catch(error => { res.send(error) })
    },
    error404: function (req, res) {
        res.render('error404');
    },
    admin: function (req, res) {
        res.render('admin/adminPanel');
    },
    adminProducts: function (req, res) {
        res.render('admin/adminProducts');
    }
};

module.exports = mainController;