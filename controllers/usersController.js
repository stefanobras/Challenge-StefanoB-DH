const bcrypt = require('bcryptjs');
const db = require('../database/models');
const crypto = require("crypto");
const { validationResult } = require('express-validator');

const usersController = {

   register: (req, res, next) => {
    let loggedIn = false;
      res.render('register', {loggedIn} );
   },
   login: (req, res, next) => {
    let loggedIn = false;
      res.render('login', {loggedIn} );
   },
   processRegister (req, res) {
      const errors = validationResult(req);
  
      if (errors.isEmpty()) {
        const _body = req.body;
        delete _body.retype;
        _body.password = bcrypt.hashSync(_body.password, 10);
        _body.rol = 0;
  
        db.User.create(_body)
          .then(() => res.redirect('/login'))
      } else {
            return res.render('register', {
               errors: errors.mapped(),
               old: req.body,
            });
      }
    },
    processLogin(req, res) {
      const errors = validationResult(req);
  
      if (errors.isEmpty()) {
        db.User.findOne({
          where: {
            email: req.body.email,
          },
        })
          .then((user) => {
            let _user = { ...user.dataValues };
            req.session.user = _user;
  
            if (req.body.remember) {

             const token = crypto.randomBytes(64).toString("base64");

             res.cookie("userToken", token, {
              maxAge: 1000 * 60 * 60 * 24 * 90,
             });

             db.Token.create({
               token,
               idUser: user.id,
             })
                .then((response) => res.redirect("/"))
               .catch((e) => console.log(e));
            } else {
              let loggedIn = true;
              return res.render("index", {loggedIn});
              
            }
          })
          .catch((e) => console.log(e));
      } else {
        return res.render("login", {
          errors: errors.mapped(),
          old: req.body,
        });
      }
    },
}

module.exports = usersController;

