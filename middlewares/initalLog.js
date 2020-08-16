module.exports = (req, res, next) => {
    if (!req.session.user) {
        let loggedIn = false;
        return res.render('index', { loggedIn });
    } else {
        let loggedIn = true;
        return res.render('index', { loggedIn })
    }

    return next();
}