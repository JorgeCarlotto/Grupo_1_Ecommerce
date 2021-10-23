const path = require('path')
const fs = require('fs')

const productsFilePath = path.join(__dirname, '../data/productDataBase.json');
const products = JSON.parse(fs.readFileSync(productsFilePath, 'utf-8'));

const listaProductos = [{
        id: 1,
        nombre: 'Chocotorta',
        descripcionCorta: '',
        descripcionDetallada: '',
        precio: '65.50',
        img: ''
    },
    {
        id: 2,
        nombre: 'Chocotorta - 2',
        descripcionCorta: '',
        descripcionDetallada: '',
        precio: '65.50',
        img: ''
    },
]

let productController = {
    index: function (req, res) {
        res.render('product/index', {
            products: products
        })
    },
    create: function (req, res) {
        res.render('product/create')
    },
    edit: function (req, res) {
        res.render('product/edit')
    },
    show: function (req, res) {
        let product = products.find(product => product.id == req.params.id);
        res.render('product/show', {product: product})
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