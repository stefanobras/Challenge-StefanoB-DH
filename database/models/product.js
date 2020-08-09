'use strict';
module.exports = (sequelize, DataTypes) => {
  const Product = sequelize.define('Product', {
    name: DataTypes.STRING,
    description: DataTypes.TEXT,
    price: DataTypes.DECIMAL,
    img:DataTypes.STRING,
    sale:DataTypes.INTEGER,
    idCategory:DataTypes.INTEGER,
  }, {});
  Product.associate = function(models) {

    Product.belongsTo(models.Category, {
      as: 'category',
      foreignKey: 'idCategory'
    })

  };
  return Product;
};