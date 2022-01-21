const path = require('path');
const db = require('../../src/database/models');
const sequelize = db.sequelize;
const { Op } = require("sequelize");
/* const moment = require('moment'); */


//---------------------------
//Dentro del actorsAPIController uso las dos forma de poder llamar a nuestros modelo
//----------------------------------
const productsAPIController = {
    'list': (req, res) => {
        db.Product.findAll()
        
        .then(product => {
            console.log(product)
            let respuesta = {
                meta: {
                    status : 200,
                    total: product.length,
                    url: 'api/products'
                },
                data:[{
                    total: product.length,
                    products : product
                }]
            }
                res.json(respuesta);
               
            })
    }
    
}
module.exports = productsAPIController