let path = require('path');

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
        res.render('product/index')
    },
    create: function (req, res) {
        res.render('product/create')
    },
    edit: function (req, res) {
        let producto = listaProductos.find(producto => producto.id == req.params.id);
        res.render('product/edit', {
            producto: producto
        })
    },
    show: function (req, res) {
        let producto = listaProductos.find(producto => producto.id == req.params.id);
        res.render('product/show', {
            producto: producto
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