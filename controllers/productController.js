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
        res.render('productDetail', {
            producto: producto
        })
    },
}

module.exports = productController;