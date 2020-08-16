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
        if (!req.session.user) {
            let loggedIn = false;
            const category = Category.findByPk(req.params.id);
            const product = Product.findAll({
                where : {
                    idCategory : req.params.id
                }
            })

            Promise.all([product, category, loggedIn])
			.then(([product, category, loggedIn]) => {
				return res.render('category', { product, category, loggedIn })
			})

        } else {
            let loggedIn = true;
            const category = Category.findByPk(req.params.id);
            const product = Product.findAll({
                where : {
                    idCategory : req.params.id
                }
            })

            Promise.all([product, category, loggedIn])
			.then(([product, category, loggedIn]) => {
				return res.render('category', { product, category, loggedIn })
			})
            
        }

        

        

        
    },
	
};

module.exports = controller;