const {Category, Product} = require('../database/models')
const { validationResult } = require('express-validator');
const db = require('../database/models');

const controller ={
	
	// Detail - Detail from one product
	detail (req, res) {
		if (!req.session.user) {
            let loggedIn = false;
            const product = Product.findByPk(req.params.id)
            

            Promise.all([product, loggedIn])
			.then(([product, loggedIn]) => {
				return res.render('product', { product, loggedIn })
			})

        } else {
            let loggedIn = true;
			const product = Product.findByPk(req.params.id)

            Promise.all([product, loggedIn])
			.then(([product, loggedIn]) => {
				return res.render('product', { product, loggedIn })
			})
            
        }


	},
	store (req, res) {
		let loggedIn = true;

		const errors = validationResult(req);

		if(errors.isEmpty()){
			const _body = req.body;
			_body.description = req.body.description;
			_body.price = Number(req.body.price);
			_body.img= req.file.filename;
			_body.idUser = req.session.user.id;
			_body.idCategory = Number(req.body.category);

			db.Product.create(_body)
				.then(product => {
					
					res.render('index', { loggedIn })
				})
				.catch(e => console.log(e));
		} else {
			const categories = Category.findAll();

			Promise.all([categories,])
				.then(([categories,]) => res.render('crud-create', { categories, errors: errors.mapped(), old: req.body, loggedIn }))
				.catch(e => console.log(e));
		}

	},

 
};

module.exports = controller;