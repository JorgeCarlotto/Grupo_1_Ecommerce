let path = require('path');

let productController = {
    index: function (req, res) {
        res.sendFile(path.join(__dirname, '../views/productDetail.html'))
    },
}

module.exports = productController;