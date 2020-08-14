'use strict';
module.exports = (sequelize, DataTypes) => {
  const Token = sequelize.define('Token', {
    token: DataTypes.STRING,
    idUser:DataTypes.INTEGER,
  }, {
    tablename: 'tokens'
  });

  Token.associate = function(models) {
    
    Token.belongsTo(models.User, {
        as: 'user',
        foreignKey: 'idUser'
    });

  };
  return Token;
};