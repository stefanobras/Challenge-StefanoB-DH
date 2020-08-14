const { Category, Product } = require('../database/models');

const controller = {

    root: (req, res) => {
		let categories = Category.findAll({
	
		})
        let products = Product.findAll({
            where: {
                idCategory: req.params.id
            

                
            }

        })

		Promise.all([categories, product])
		.then(([categories, product]) => {
            return res.render('category', { categories, product })
        
        })
    
},
    detail (req, res) {
        const category = Category.findByPk(req.params.id);

        const product = Product.findAll({
            where : {
                idCategory : req.params.id
            }
        })

        Promise.all([product, category])
			.then(([product, category]) => {
				return res.render('category', { product, category })
			})
},
	
};

module.exports = controller;