module.exports = (sequelize, dataTypes) =>{

    let alias = "Users"
    let cols = {
        id:{
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        email :{
            allowNull : false,
            type: dataTypes.STRING,
            type: dataTypes.STRING
        },
        password : {
            allowNull: false,
            type: dataTypes.STRING

        },
        admin :{
            allowNull : false,
            type: dataTypes.TINYINT,
        }, 
    
    }
    let config = {
        tableName: "users",
        timestamps: false
    }
const User = sequelize.define(alias,cols,config);

/*
User.associate = function (models){
    User.hasMany(models.Sales,{
        as:"sale",
        foreignKey:"user_id"
    });
    User.belongsTo(models.Profiles,{
        as:"profile",
        foreignKey:"user_id"
    })*/

    return User;
}
;
