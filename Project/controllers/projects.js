const { pool } = require('../utils/database');

/* Controller to retrieve projects from database */
exports.getProjects = (req, res, next) => {

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM projects')
        .then(([rows, fields]) => {
            res.render('projects.ejs', {
                pageTitle: "Projects",
                projects: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}


/* Controller to delete projects by ID from database */
exports.postDeleteProjects = (req, res, next) => {
    /* get id from params */
    const id = req.params.id;
    
    /* create the connection, execute query and redirect */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM projects WHERE project_id = ${id}`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/projects');
        })
        .catch(err => {
            res.redirect('/projects');
        })
    })

}

/* Controller to create a new projects in the database */
exports.postAddProjects = (req, res, next) => {

    /* get necessary data sent */
    const title = req.body.title;
    const summary = req.body.summary;
    const starting_date = req.body.starting_date;
    const ending_date = req.body.ending_date;
    const funding = req.body.funding;
    const duration = req.body.duration;
    const staff_id = req.body.staff_id;
    const program_id = req.body.program_id;
    const organization_id = req.body.organization_id;
    const researcher_id = req.body.researcher_id;

    /* create the connection, execute query, and redirect*/
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO projects(title, summary, starting_date, ending_date, funding, duration, staff_id, program_id, organization_id, researcher_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

        conn.promise().query(sqlQuery, [title, summary, starting_date, ending_date, funding, duration, staff_id, program_id, organization_id, researcher_id])
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/projects');
        })
        .catch(err => {
            res.redirect('/projects');
        })
    })
}


/* Controller to update a projects in the database */
exports.postUpdateProjects = (req, res, next) => {

    /* get necessary data sent */
    const project_id = req.body.project_id;
    const title = req.body.title;
    const summary = req.body.summary;
    const starting_date = req.body.starting_date;
    const ending_date = req.body.ending_date;
    const funding = req.body.funding;
    const duration = req.body.duration;
    const staff_id = req.body.staff_id;
    const program_id = req.body.program_id;
    const organization_id = req.body.organization_id;
    const researcher_id = req.body.researcher_id;

    /* create the connection, execute query and redirect */
    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE projects SET title = ?, summary = ?, starting_date = ?, ending_date = ?, funding = ?, duration = ?, staff_id = ?, program_id = ?, organization_id = ?, researcher_id = ? WHERE project_id = ${project_id}`;

        conn.promise().query(sqlQuery, [title, summary, starting_date, ending_date, funding, duration, staff_id, program_id, organization_id, researcher_id])
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/projects');
        })
        .catch(err => {
            res.redirect('/projects');
        })
    })
}