'use strict';
module.exports = (sequelize, DataTypes) => {
  const Category = sequelize.define('Category', {
    name: DataTypes.STRING
  }, {
    tablename: 'categories'
  });

  Category.associate = function(models) {
    
    Category.hasMany(models.Product, {
      as: 'products',
      foreignKey: 'idCategory'
    })

  };
  
  return Category;
};