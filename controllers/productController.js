//Require
const path = require('path')
const fs = require('fs');


//Database JSON
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