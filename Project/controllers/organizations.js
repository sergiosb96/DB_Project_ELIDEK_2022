const { pool } = require('../utils/database');

/* Controller to retrieve organizations from database */
exports.getOrganizations = (req, res, next) => {

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM organizations')
        .then(([rows, fields]) => {
            res.render('organizations.ejs', {
                pageTitle: "Organizations",
                organizations: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}


/* Controller to delete organizations by ID from database */
exports.postDeleteOrganizations = (req, res, next) => {
    /* get id from params */
    const id = req.params.id;
    
    /* create the connection, execute query and redirect */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM organizations WHERE organization_id = ${id}`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/organizations');
        })
        .catch(err => {
            res.redirect('/organizations');
        })
    })

}

/* Controller to create a new organizations in the database */
exports.postAddOrganizations = (req, res, next) => {

    /* get necessary data sent */
    const organization_id = req.body.organization_id
    const name = req.body.name;
    const abbreviation = req.body.abbreviation;
    const street = req.body.street;
    const number = req.body.number;
    const postal_code = req.body.postal_code;
    const city = req.body.city;

    /* create the connection, execute query, and redirect*/
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO organizations(organization_id, name, abbreviation, street, number, postal_code, city) VALUES(?, ?, ?, ?, ?, ?, ?)`;

        conn.promise().query(sqlQuery, [organization_id, name, abbreviation, street, number, postal_code, city])
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/organizations');
        })
        .catch(err => {
            res.redirect('/404');
        })
    })
}


/* Controller to update a organizations in the database */
exports.postUpdateOrganizations = (req, res, next) => {

    /* get necessary data sent */
    const organization_id = req.body.organization_id
    const name = req.body.name;
    const abbreviation = req.body.abbreviation;
    const street = req.body.street;
    const number = req.body.number;
    const postal_code = req.body.postal_code;
    const city = req.body.city;

    /* create the connection, execute query and redirect */
    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE organizations SET organization_id = ?, name = ?, abbreviation = ?, street = ?, number = ?, postal_code = ?, city = ? WHERE organization_id = ${organization_id}`;

        conn.promise().query(sqlQuery, [organization_id, name, abbreviation, street, number, postal_code, city])
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/organizations');
        })
        .catch(err => {
            res.redirect('/404');
        })
    })
}