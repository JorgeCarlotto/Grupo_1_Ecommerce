let path = require('path');

let mainController = {
    index: function (req, res) {
        res.sendFile(path.join(__dirname, '../views/index.html'))
    },
    register: function (req, res) {
        res.sendFile(path.join(__dirname, '../views/register.html'))
    },
    login: function (req, res) {
        res.sendFile(path.join(__dirname, '../views/login.html'))
    },
    product_car: function (req, res) {
        res.sendFile(path.join(__dirname, '../views/productCart.html'))
    },
}

module.exports = mainController;