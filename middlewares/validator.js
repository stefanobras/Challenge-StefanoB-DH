const { body } = require("express-validator");
const bcrypt = require("bcryptjs");

const { User } = require("../database/models");

module.exports = {
    register: [

    body("name")
      .notEmpty()
      .withMessage("Este campo es obligatorio")
      .bail(),

    body("surname")
    .notEmpty()
    .withMessage("Este campo es obligatorio")
    .bail(),  

    body("email")
      .notEmpty()
      .withMessage("Este campo es obligatorio")
      .bail()
      .isEmail()
      .withMessage("Este Email no es válido")
      .bail()
      .custom((value) => {
        return User.findOne({
          where: {
            email: value,
          },
        }).then((user) => {
          if (user) {
            return Promise.reject("Email registrado");
          }
        });
      }),
    
    body("password")
      .notEmpty()
      .withMessage("Este campo es obligatorio")
      .bail()
      .isLength({ min: 5 })
      .withMessage("Tu contraseña debe tener mínimo 5 carácteres"),

  ],
  login: [

    body("email")
      .notEmpty()
      .withMessage("Campo obligatorio")
      .bail()
      .isEmail()
      .withMessage("Este email no es válido")
      .bail()
      .custom((value, { req }) => {
        return User.findOne({
          where: {
            email: value,
          },
        }).then((user) => {
          if (user) {
            if (!bcrypt.compareSync(req.body.password, user.password)) {
              return Promise.reject("La Contraseña y/o Email no coinciden");
            }
          } else {
            return Promise.reject("La Contraseña y/o Email no coinciden");
          }
        });
      }),
  ],
}