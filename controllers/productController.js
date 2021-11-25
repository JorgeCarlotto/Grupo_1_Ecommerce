
const db = require('../src/database/models');
const sequelize = db.sequelize;
const { Op } = require("sequelize");


let productController = {
    index: function (req, res) {
        db.Product
        .findAll()
        .then(products => res.render('product/index', {
            products
        }))
        .catch(error  => {
            console.log(error)
            res.send(error)
        })

        
    },
    create: function (req, res) {
        res.render('product/create', {
            categoryProducts: categoryProducts
        })
    },
    store: function (req, res) {
        let img

        if (req.file != undefined) {
            img = req.file.filename
        } else {
            img = 'product-default.png'
        }

        let ids = products.map(p => p.id)

        let newProduct = {
            id: Math.max(...ids) + 1,
            ...req.body,
            img: img
        };
        products.push(newProduct)
        fs.writeFileSync(productsFilePath, JSON.stringify(products, null, ' '));
        res.redirect('/products');
    },
    edit: function (req, res) {
        let product = products.find(product => product.id == req.params.id);
        res.render('product/edit', {
            product: product,
            categoryProducts: categoryProducts
        })
    },
    show: function (req, res) {
        let product = products.find(product => product.id == req.params.id);
        res.render('product/show', {
            product: product
        })
    },
    update: function (req, res) {
        res.send('Producto actualizado')
    },
    shoppingCart: function (req, res) {
        res.render('product/shoppingCart')
    },
    destroy: (req, res) => {
        let id = req.params.id;
        let finalProducts = products.filter(product => product.id != id);
        fs.writeFileSync(productsFilePath, JSON.stringify(finalProducts, null, ' '));
        res.redirect('/');
    }
}

module.exports = productController;