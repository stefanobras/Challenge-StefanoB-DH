'use strict';
module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define('User', {
    name: DataTypes.STRING,
    surname: DataTypes.STRING,
    address: DataTypes.STRING,
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    rol: DataTypes.TINYINT,
  }, {});

  User.associate = function(models) {
    
    User.hasMany(models.Token, {
      as: 'tokens',
      foreignKey: 'idUser'
    });

    User.hasMany(models.Cart, {
      as: 'carts',
      foreignKey: 'idUser'
    });

  };

  return User;
};