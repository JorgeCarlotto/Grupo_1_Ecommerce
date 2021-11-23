const path = require('path');
const fs = require('fs');

const commenstsFilePath = path.join(__dirname, '../data/commentsDataBase.json');
const commenst = JSON.parse(fs.readFileSync(commenstsFilePath, 'utf-8'));

let mainController = {
    admin: function (req,res){
        res.render('admin/adminPanel');
    },
    adminProducts: function(req, res){
        res.render('admin/adminProducts');
    }
};

module.exports = mainController;