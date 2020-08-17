const { body } = require("express-validator");
const bcrypt = require("bcryptjs");
const path = require('path');


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
            Promise.reject("La Contraseña y/o Email no coinciden");
          }
        });
      }),
  ],
  addToCart: [
    body("quantity")
      .custom((value) => value > 0)
      .withMessage("Debe agregar al menos 1 producto al carrito"),
  ],
  createProduct: [
    body("name").notEmpty().withMessage("Campo obligatorio"),
    body("price")
      .notEmpty()
      .withMessage("Campo obligatorio")
      .bail()
      .isNumeric()
      .withMessage("Solo se aceptan números")
      .bail()
      .custom((value, { req }) => req.body.price > 0)
      .withMessage("No se aceptan números negativos"),
    body("image")
      .custom((value, { req }) => req.file)
      .withMessage("Debes ingresar una imagen para tu producto")
      .bail()
      .custom((value, { req }) => {
        const acceptedExtensions = [".jpg", ".jpeg", ".png"];
        const ext = path.extname(req.file.originalname);
        return acceptedExtensions.includes(ext);
      })
      .withMessage(
        "La imagen debe tener uno de los siguientes formatos: JPG, JPEG, PNG"
      ),
    body("category").notEmpty().withMessage("Campo obligatorio"),
    body("description")
      .notEmpty()
      .withMessage("Campo obligatorio")
      .bail()
      .isLength({ min: 5 })
      .withMessage("La descripción debe tener al menos 30 carácteres")
      .bail()
      .isLength({ max: 100 })
      .withMessage("La descripción debe tener menos de 100 carácteres"),
  ],
}