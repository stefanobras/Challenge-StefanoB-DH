const { Product } = require('../database/models');

const controller = {
	root: (req, res) => {
		let products = Product.findAll({
			limit: 6
		})


		Promise.all([products])
		.then(([products]) => {
			// res.locals.categories = categories;
			// return res.send(data[0]);
			return res.render('index', { products })
		})
	},    
	search: (req, res) => {     
		///////falta el armar el codigo del search!!               
		return res.render('results', {productos})
	},
	load : (req, res, next) => {
		res.render('index', { title: 'Express' });
	  },
};

module.exports = controller;