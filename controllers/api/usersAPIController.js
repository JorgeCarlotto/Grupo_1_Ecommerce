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
    },
    'top': async (req, res) => {
        const pageAsNumber = Number.parseInt(req.query.page);
        const sizeAsNumber = Number.parseInt(req.query.size);
      
        let page = 0;
        if(!Number.isNaN(pageAsNumber) && pageAsNumber > 0){
          page = pageAsNumber;
        }
      
        let size = 5;
        if(!Number.isNaN(sizeAsNumber) && !(sizeAsNumber > 5) && !(sizeAsNumber < 1)){
          size = sizeAsNumber;
        }
      
        const usersWithCount = await db.Users.findAndCountAll({
            limit: size,
            offset: page * size
        });
        
        res.json(usersWithCount.rows)

        
      }
}
module.exports = usersAPIController