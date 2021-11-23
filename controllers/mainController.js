const path = require('path');
const fs = require('fs');

const commenstsFilePath = path.join(__dirname, '../data/commentsDataBase.json');
const commenst = JSON.parse(fs.readFileSync(commenstsFilePath, 'utf-8'));

let mainController = {
    index: function (req, res) {
        res.render('main/index');
    },
    comment: (req, res) => {
        let comment
        let ids = commenst.map(p => p.id)
        let newComment = {
            id: Math.max(...ids) + 1,
            ...req.body,
            comment: comment
        };

        commenst.push(newComment)
        fs.writeFileSync(commenstsFilePath, JSON.stringify(commenst, null, ' '));
        res.redirect('/');
    },
    error404: function (req, res) {
        res.render('error404');
    },
    admin: function (req,res){
        res.render('main/adminPanel');
    }
};

module.exports = mainController;