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

/* Controller to render data shown in create projects page */
exports.getCreateProjects = (req, res, next) => {
    res.render('add_projects.ejs', {
        pageTitle: "Projects Creation Page"
    })
}


/* Controller to render data shown in create researchers page */
exports.getCreateResearchers = (req, res, next) => {
    res.render('add_researchers.ejs', {
        pageTitle: "Researchers Creation Page"
    })
}

/* Controller to render data shown in create program page */
exports.getCreateProgram = (req, res, next) => {
    res.render('add_program.ejs', {
        pageTitle: "Program Creation Page"
    })
}

/* Controller to render data shown in create staff page */
exports.getCreateStaff = (req, res, next) => {
    res.render('add_staff.ejs', {
        pageTitle: "Staff Creation Page"
    })
}

/* Controller to render data shown in create deliverables page */
exports.getCreateDeliverables = (req, res, next) => {
    res.render('add_deliverables.ejs', {
        pageTitle: "Deliverables Creation Page"
    })
}