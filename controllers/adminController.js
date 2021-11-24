const db = require('../src/database/models');
const sequelize = db.sequelize;

let mainController = {
    admin: function (req,res){
        res.render('admin/adminPanel');
    },
    adminProducts: function(req, res){
        db.Products.findAll()
        .then(productos => console.log(productos));
    }
};

module.exports = mainController;