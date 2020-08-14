'use strict';
module.exports = (sequelize, DataTypes) => {
  const Cart = sequelize.define('Cart', {
    cartNumber: DataTypes.INTEGER,
    total: DataTypes.INTEGER,
    idUser:DataTypes.INTEGER,
  });

  Cart.associate = function(models) {

    Cart.belongsTo(models.User, {
      as: 'user',
      foreignKey: 'idUser'
    });

    Cart.hasMany(models.Item, {
        as : 'items',
        foreignKey : 'idCart',
    });

  };
  return Cart;
};