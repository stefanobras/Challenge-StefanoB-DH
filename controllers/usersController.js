const bcrypt = require('bcryptjs');
const db = require('../database/models');

const usersController = {
   register: (req, res, next) => {
      res.render('register', {title: 'Express'});
   },
   login: (req, res, next) => {
      res.render('login', {title: 'Express'});
   },
   processRegister: function(req, res){

      db.User.create({
         name : req.body.name,
         surname : req.body.surname,
         address : req.body.address,
         email : req.body.email,
         password : req.body.password,
         rol: 0
      }).then(() => {
         return res.redirect('/login');
      })
   },
   processLogin: function(req,res){

      return db.User.findOne({ 
         where: { 
            email: req.body.email,
            password: req.body.password
         }}).then(() => {
            return res.redirect('/');
         })
   }
}

module.exports = usersController;

