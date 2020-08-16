module.exports = (req, res, next) => {

    if(req.session.user){
        var logged = true;
        return res.redirect('/', { logged });
    } else {
        return next();
    }
    
}