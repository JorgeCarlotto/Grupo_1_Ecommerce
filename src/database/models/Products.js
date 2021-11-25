module.exports = (sequelize, dataTypes) => {
    let alias = 'Products';
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: dataTypes.STRING(100),
            allowNull: false
        },
        description: {
            type: dataTypes.STRING,
            allowNull: false
        },
        stock: {
            type: dataTypes.INTEGER,
            allowNull: false
        },
        price: {
            type: dataTypes.FLOAT,
            allowNull: false
        },
        status: {
            type: dataTypes.BOOLEAN,
            defaultValue: true
        },
        category_id: {
            type: dataTypes.INTEGER,
            allowNull: false
        },
        flavor_id: {
            type: dataTypes.INTEGER
        }
    };
    let config = {
        tableName: 'products',
        timestamps: true
    };
    const Product = sequelize.define(alias, cols, config)

    return Product
}