let path = require('path');

let mainController = {
    index: function (req, res) {
        res.render('main/bootstrapIndex')
    },
    register: function (req, res) {
        res.render('register')
    },
    login: function (req, res) {
        res.render('login')
    },
    error404: function(req, res){
        res.render('error404')
    }
    
}



module.exports = mainController;