'use strict';
module.exports = (sequelize, DataTypes) => {
  const Item = sequelize.define('Item', {
    price: DataTypes.DECIMAL,
    quantity: DataTypes.INTEGER,
    subTotal: DataTypes.INTEGER,
    status:DataTypes.TINYINT,
    idUser:DataTypes.INTEGER,
    idProduct:DataTypes.INTEGER,
    idCart:DataTypes.INTEGER,
  }, {
  });

  Item.closeItems = function(idUser) {
      return sequelize.query(
        `UPDATE items SET status = 0 WHERE idUser = ${idUser} AND status = 1`
      );
  };

  Item.assignItems = function (idUser, idCart) {
      return sequelize.query(
        `UPDATE items SET idCart = ${idCart} WHERE idUser = ${idUser} AND idCart IS NULL`
      );
  };

  Item.associate = function(models) {

    Item.belongsTo(models.User, {
      as: 'user',
      foreignKey: 'idUser'
    });

    Item.belongsTo(models.Cart, {
        as : 'cart',
        foreignKey : 'idCart',
    });

    Item.belongsTo(models.Product, {
        as : 'product',
        foreignKey : 'idProduct',
    });

  };
  return Item;
};