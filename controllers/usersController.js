const bcrypt = require('bcryptjs');
const { User } = require('../database/models/user');
const Product = require('../database/models/product');

const controller = {
   register: function(req, res) {
      return res.render('/register');
   },
   processRegister: function(req, res){

      let user = req.body;

      // Crear objeto que se va a guardar en la DB

      delete user.retype;
      user.password = bcrypt.hashSync(user.password, 10)
      user.rol = 0

      // return res.send(user)
      
      User.create(user)
         .then(() => res.redirect('/users/login'))

   },
   login: function(req, res) {
      return res.render('users/login');
   },
   processLogin: function (req, res) {
      
      User.findOne({
         where: {
            email: req.body.email
         }
      })
         .then(user => {

            if(user){
               if(bcrypt.compareSync(req.body.password, user.password)){
                  let userSession = user;

                  delete userSession.password;

                  req.session.user = userSession;

                  return res.redirect('/');

               } else {
                  return res.send('La password no coincide')
               }
            } else {
               return res.send('No se encontro usuario')
            }
         })

   },
   logout: function (req, res) {
      req.session.destroy();

      if(req.cookies.email){
         res.clearCookie('email');
      }

      return res.redirect('/');
   },

   profile: function (req, res) {
      return res.render('users/profile')
   }
}

module.exports = controller;