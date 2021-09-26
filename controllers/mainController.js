let path = require('path');

let mainController = {
    index: function (req, res) {
        res.sendFile(path.join(__dirname, '../views/index.html'))
    },
    register: function (req, res) {
        res.sendFile(path.join(__dirname, '../views/register.html'))
    },
}

module.exports = mainController;