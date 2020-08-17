const bcrypt = require('bcryptjs');
const db = require('../database/models');
const crypto = require("crypto");
const { validationResult } = require('express-validator');

const usersController = {

   register: (req, res, next) => {
    let loggedIn = false;
      res.render('register', {loggedIn});
   },
   login: (req, res, next) => {
    let loggedIn = false;
      res.render('login', {loggedIn});
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
            let loggedIn = false;
            res.render('register', { 
              errors: errors.mapped(),
              old: req.body,
              loggedIn,
            });
      }
    },
    logout(req, res) {

      db.Item.destroy({
        where: {
          idUser: req.session.user.id,
          status: 1,
        },
      })
        .then(() => {
          req.session.destroy();
  
          return res.redirect("/");
          
        })
        .catch((e) => console.log(e));
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
            let loggedIn = true;
            let User = db.User;
  
            if (req.body.remember) {

             const token = crypto.randomBytes(64).toString("base64");

             res.cookie("userToken", token, {
              maxAge: 1000 * 60 * 60 * 24 * 90,
             });

             db.Token.create({
               token,
               idUser: user.id,
             })
                .then((response) => res.render("index", { loggedIn}))
               .catch((e) => console.log(e));
            } else {
              let loggedIn = true;
              return res.render("index", {loggedIn});
              
            }
          })
          .catch((e) => console.log(e));
      } else {
        let loggedIn = false;
        res.render("login", { 
          errors: errors.mapped(),
          old: req.body,
          loggedIn,
        });
      }
    },
    
    cart(req, res){
      db.Item.findAll({
        where: {
          idUser: req.session.user.id,
          status: 1,
        },
        include: ['product'],
      }).then((items) => {
        let loggedIn = true;
        res.render("cart", { items, loggedIn})
      });
    },

    addToCart(req, res) {
      db.Product.findByPk(req.body.idProduct, {
        })
          .then((product) => {
            return db.Item.create({
              price: product.price,
              quantity: req.body.quantity,
              subTotal: product.price * req.body.quantity,
              status: 1,
              idUser: req.session.user.id,
              idProduct: product.id,
            });
          })
          .then((item) => res.redirect("/cart"))
          .catch((e) => console.log(e));
      
    },

    deleteFromCart(req, res) {
      db.Item.destroy({
        where: {
          id: req.body.idItem,
        },
        force: true,
      })
        .then((response) => res.redirect("/cart"))
        .catch((e) => console.log(e));
    },

    shop(req, res) {
      let items;
  
      db.Item.findAll({
        where: {
          idUser: req.session.user.id,
          status: 1,
        },
      })
        .then((itemsSearched) => {
          items = itemsSearched;
          return db.Item.closeItems(req.session.user.id);
        })
        .then(() => {
          return db.Cart.findOne({
            order: [["createdAt", "DESC"]],
          });
        })
        .then((cart) => {
          return db.Cart.create({
            cartNumber: cart ? ++cart.cartNumber : 1000,
            total: items.reduce(
              (total, item) => (total = total + item.subTotal),
              0
            ),
            idUser: req.session.user.id,
          });
        })
        .then((cart) => {
          return db.Item.assignItems(req.session.user.id, cart.id);
        })
        .then(() => res.redirect("/"))
        .catch((e) => console.log(e));
    },
}

module.exports = usersController;

