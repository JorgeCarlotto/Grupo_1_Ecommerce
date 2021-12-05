module.exports = (sequelize, dataTypes) => {
    let alias = 'Company';
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
        phone: {
            type: dataTypes.STRING(255),
            allowNull: false
        },
        cuit: {
            type: dataTypes.STRING(255),
            allowNull: false
        },
        email: {
            type: dataTypes.STRING(255),
            allowNull: false
        }
    };
    let config = {
        tableName: 'company',
        timestamps: false
    };
    const Company = sequelize.define(alias, cols, config)

    return Company
}