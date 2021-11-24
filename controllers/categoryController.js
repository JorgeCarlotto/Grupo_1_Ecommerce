const { render } = require('ejs');
const db = require('../src/database/models');

let categoryController = {
    list: function (req,res){
        res.render('admin/category/list');
    }
};

module.exports = categoryController;