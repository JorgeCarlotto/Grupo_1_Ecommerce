
const fs = require('fs')

const User = {
    
    fileName:'./data/usuariosDataBase.json',
    
    getData: function(){
        return JSON.parse(fs.readFileSync(this.fileName, 'utf-8'))
    },
    genereID: function () {
        let allUsers = this.findAll();
        let lastUser = allUsers.pop();
        if(lastUser){
            return lastUser.id +1;
        }
        return 1;
        
    },
    findAll: function (){
        return this.getData();
    },
    findByPk: function (id) {
        let allUsers = this.findAll();
        let userFound = allUsers.find( user => user.id === id );
        return userFound;
    },
    findByField: function (field, text) {
        let allUsers = this.findAll();
        let userFound = allUsers.find( user => user[field] === text );
        return userFound;
    },
    create: function (userData){
        let allUsers = this.findAll();
        let newUser={
            id: this.genereID(),
            ...userData
        }

        allUsers.push(newUser);
        fs.writeFileSync(this.fileName,JSON.stringify(allUsers, null, ' '));
        return true;
    },
    delete:function(id){
        let allUsers = this.findAll();
        let finalUser = allUsers.filter(users => users.id !== id);
        fs.writeFileSync(this.fileName,JSON.stringify(finalUser, null, ' '));
        return true;
    }

}

module.exports = User;
