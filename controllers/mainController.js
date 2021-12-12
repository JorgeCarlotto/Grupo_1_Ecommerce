const path = require('path');
const fs = require('fs');

let mainController = {
    index: function (req, res) {
        res.render('main/index');
    },
    error404: function (req, res) {
        res.render('error404');
    },
    admin: function (req,res){
        res.render('admin/adminPanel');
    },
    adminProducts: function(req, res){
        res.render('admin/adminProducts');
    }
};

module.exports = mainController;