module.exports = (req, res, next) => {
    if (!req.session.user.rol == 1) {
        return res.redirect('/');
    }

    return next();
}