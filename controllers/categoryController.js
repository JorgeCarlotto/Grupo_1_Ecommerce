const { render } = require('ejs');
const db = require('../src/database/models');

let categoryController = {
    list: function (req,res){
        db.Category
        .findAll()
        .then(categories => res.render('admin/category/list',{categories}))
    }
};

module.exports = categoryController;