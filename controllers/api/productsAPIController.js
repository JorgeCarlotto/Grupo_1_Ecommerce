const path = require('path');
const db = require('../../src/database/models');
const sequelize = db.sequelize;
const { Op } = require("sequelize");
const req = require('express/lib/request');
/* const moment = require('moment'); */


//---------------------------
//Dentro del actorsAPIController uso las dos forma de poder llamar a nuestros modelo
//----------------------------------
const productsAPIController = {
    'list': (req, res) => {
        db.Product.findAll()
        .then(products => {
            let respuesta = {
                meta: {
                    status : 200,
                    total: products.length,
                    url: 'api/products'
                },
                data:[{
                    total: products.length,
                    products:products
                }]
            }
                res.json(respuesta);
               
            })
    },

    'top': async (req, res) => {
        const pageAsNumber = Number.parseInt(req.query.page);
        const sizeAsNumber = Number.parseInt(req.query.size);
      
        let page = 0;
        if(!Number.isNaN(pageAsNumber) && pageAsNumber > 0){
          page = pageAsNumber;
        }
      
        let size = 10;
        if(!Number.isNaN(sizeAsNumber) && !(sizeAsNumber > 10) && !(sizeAsNumber < 1)){
          size = sizeAsNumber;
        }
      
        const productsWithCount = await db.Product.findAndCountAll({
            include : [
                {association: 'category'},
                {association : 'flavors'}
                ],
            limit: size,
            offset: page * size
        });
        
        res.json(productsWithCount.rows)

        
      }

    }
    
module.exports = productsAPIController

//res.send({
    /* url: 'api/products/total', */
     // content:productsWithCount
    /* totalPages: Math.ceil(productsWithCount.count / Number.parseInt(size)) */
  //}) //