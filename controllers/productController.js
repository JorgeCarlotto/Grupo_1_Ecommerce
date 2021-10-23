const path = require('path')
const fs = require('fs')

const productsFilePath = path.join(__dirname, '../data/productDataBase.json');
const categoryProductsFilePath = path.join(__dirname, '../data/categoryDataBase.json');

const products = JSON.parse(fs.readFileSync(productsFilePath, 'utf-8'));
const categoryProducts = JSON.parse(fs.readFileSync(categoryProductsFilePath, 'utf-8'));

let productController = {
    index: function (req, res) {
        res.render('product/index', {
            products: products
        })
    },
    create: function (req, res) {
        console.log(categoryProducts);
        res.render('product/create', {
            categoryProducts: categoryProducts
        })
    },
    edit: function (req, res) {
        console.log(categoryProducts);
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
    delete: function (req, res) {
        res.send('Eliminar producto')
    },
    shoppingCart: function (req, res) {
        res.render('product/shoppingCart')
    },
}

module.exports = productController;