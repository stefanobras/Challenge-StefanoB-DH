const { Item } = require('../database/models');

module.exports = async (req, res, next) => {
    if (req.session.user) {
        Item.findAndCountAll({
            where : {
                idUser : req.session.user.id,
                status : 1
            },
            force : true
        }).then(data => {
            res.locals.cartQty = data.count;
            return next();
        })
    } else {
        return next();
    }
}