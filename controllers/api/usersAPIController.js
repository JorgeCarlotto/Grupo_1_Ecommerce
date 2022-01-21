const path = require('path');
const db = require('../../src/database/models');
const sequelize = db.sequelize;
const { Op } = require("sequelize");
/* const moment = require('moment'); */


//Aqui tienen otra forma de llamar a cada uno de los modelos
/* const Movies = db.Movie;
const Genres = db.Genre;
const Actors = db.Actor; */
//---------------------------
//Dentro del actorsAPIController uso las dos forma de poder llamar a nuestros modelo
//----------------------------------
const usersAPIController = {
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
                    total: users.length,
                    users
                }]
            }
                res.json(respuesta);
            })
    }
}
module.exports = usersAPIController