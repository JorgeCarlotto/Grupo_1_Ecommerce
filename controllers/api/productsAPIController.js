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
        db.Users.findAll()
        .then(users => {
            let respuesta = {
                meta: {
                    status : 200,
                    total: users.length,
                    url: 'api/users'
                },
                data:[{
                    total: users.length
                }]
            }
                res.json(respuesta);
            })
    }
}
module.exports = productsAPIController