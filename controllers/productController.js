let path = require('path');

let productController = {
    index: function (req, res) {
        res.render('productDetail')
    },
}

module.exports = productController;