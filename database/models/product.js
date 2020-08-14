'use strict';
module.exports = (sequelize, DataTypes) => {
  const Product = sequelize.define('Product', {
    name: DataTypes.STRING,
    description: DataTypes.STRING,
    price: DataTypes.DECIMAL,
    img:DataTypes.STRING,
    sale:DataTypes.INTEGER,
    idCategory:DataTypes.INTEGER,
  }, {});

  Product.associate = function(models) {

    Product.belongsTo(models.Category, {
      as: 'category',
      foreignKey: 'idCategory'
    });

    Product.hasMany(models.Item, {
      as : 'items',
      foreignKey : 'idProduct'
    });

  };
  return Product;
};