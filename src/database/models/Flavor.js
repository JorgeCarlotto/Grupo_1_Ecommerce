module.exports = (sequelize, dataTypes) => {
    let alias = 'Flavor';
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: dataTypes.STRING(100),
            allowNull: false
        }
    };
    let config = {
        tableName: 'flavors',
        timestamps: false
    };
    const Flavor = sequelize.define(alias, cols, config)

    Flavor.associate = function (models){
        Flavor.hasMany(models.Product,{
            as: 'products',
            foreignKey: 'flavor_id'
        })
    }


    return Flavor;
}