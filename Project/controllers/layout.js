const { pool } = require('../utils/database');

/* Controller to render data shown in landing page */
exports.getLanding = (req, res, next) => {
    res.render('landing.ejs', {
        pageTitle: "Dashboard",
    })
}


/* Controller to render data shown in create organizations page */
exports.getCreateOrganizations = (req, res, next) => {
    res.render('add_organizations.ejs', {
        pageTitle: "Organization Creation Page"
    })
}