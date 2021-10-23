let path = require('path');


let userController = {
    register: function (req, res) {
        res.render('user/register')
    },
    login: function (req, res) {
        res.render('user/login')
    }
    
}


module.exports = userController;