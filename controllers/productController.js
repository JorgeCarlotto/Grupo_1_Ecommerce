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
        producto = listaProductos.find(producto => producto.id == req.params.id);
        res.render('product/productDetail', {
            producto: producto
        })
    },   
     product_car: function (req, res) {
        res.render('product/productCart')
    },
    creacion_producto:function(req, res){
        res.render('product/creacionProducto')
    },
    edicion_producto:function(req, res){
        res.render('product/edicionProducto')
    },

}


module.exports = productController;