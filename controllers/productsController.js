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
	edit (req, res) {
		const product = db.Product.findByPk(req.params.id);
		const categories = db.Category.findAll();
		let loggedIn = true;

		Promise.all([product, categories, loggedIn])
			.then(([product, categories, loggedIn]) => res.render('crud-edit', { product, categories, loggedIn}))
			.catch(e => console.log(e));
	},
	update (req, res) {

		const errors = validationResult(req);

		if (errors.isEmpty()) {

			db.Product.findByPk(req.params.id)
				.then(product => {

					const _body = req.body;

					_body.price = Number(req.body.price);
					_body.img = req.file != undefined ? req.file.filename : product.image;
					_body.idUser = req.session.user.id;
					_body.idCategory = Number(req.body.category);

					return db.Product.update(_body, {
						where: {
							id: req.params.id
						}
					})
				})
				.then(confirm => res.redirect(`/product/${req.params.id}`))
				.catch(e => console.log(e));

		} else {
			const categories = Category.findAll();

			console.log(req.body)
	
			Promise.all([categories])
				.then(([categories]) => {
					
					return res.render(
						'crud-edit',
						{ 
							product: req.body,
							id: req.params.id,
							categories,
							errors: errors.mapped(),
							loggedIn
					})
				})
				.catch(e => console.log(e));
		}
	},
	destroy (req, res) {
		db.Product.destroy({
			where: {
				id: req.params.id
			},
		})
			.then(confirm => {
				res.redirect('/')
			})
			.catch(e => console.log(e));
	},

 
};

module.exports = controller;