const { render } = require('ejs');
const db = require('../src/database/models');

let categoryController = {
    list: function (req,res){
        db.Category
        .findAll()
        .then(categories => res.render('admin/category/list',{categories}))
    },
    create: function(req,res){
        res.render('admin/category/create');
    }
};

module.exports = categoryController;