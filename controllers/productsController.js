const {Category, Product} = require('../database/models')

const controller ={
	
	// Detail - Detail from one product
	detail (req, res) {
		Product.findByPk(req.params.id)
			.then(product => res.render('product', { product }))
			.catch(e => console.log(e));
	},

	// Ir a la vista del formulario 
	create: (req, res) => {
		Category.findAll()
		   .then(categories => {
		       return res.render('product-create-form', {categories});
        })
	 .catch(error => console.log(error))
    },

 // Create -  Method to store
 store: (req, res) => {

	let products = req.body;
	products.img = req.file.filename;
	products.idUser = req.session.user.id;

	// return res.send(product)

	Product.create(products)
		.then(products => {
			return res.redirect('product' + products.id)
		})
},	

	// Update - Form to edit
	edit: (req, res) => {

		const products = Product.findByPk(req.params.productsId);

		const categories = Category.findAll();

		Promise.all([products, categories])
			.then(([products, categories]) => {
				return res.render('product-edit-form', { products, categories })
			})
	},

	// Update - Method to update
	update: (req, res) => {
		let products = req.body;
		products.idUser = req.session.user.id
		products.img = req.file.filename
		Products.update(products, {
			where: {
				id: req.params.productsId
			}
		})
			.then(confirm => {
				return res.redirect('vista-producto' + req.params.productsId)
			})
			.catch(error => console.log(error))

	},	

	// Delete - Delete one product from DB
	destroy : (req, res) => {

		Product.destroy({
			where: {
				id: req.params.id
			}
		})
			.then(() => res.redirect('/'))
		
	}
};

module.exports = controller;