let path = require('path');

let mainController = {
    index: function (req, res) {
        res.render('index')
    },
    register: function (req, res) {
        res.render('register')
    },
    login: function (req, res) {
        res.render('login')
    },
    product_car: function (req, res) {
        res.render('productCart')
    },
}

module.exports = mainController;