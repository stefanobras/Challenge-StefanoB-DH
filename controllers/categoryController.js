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

		Promise.all([categories, products])
		.then(([categories, products]) => {
            return res.render('category', { categories, products })
        
        })
    
},    
	
};

module.exports = controller;