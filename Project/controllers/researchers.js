const { pool } = require('../utils/database');

/* Controller to retrieve researchers from database */
exports.getResearchers = (req, res, next) => {

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM researchers')
        .then(([rows, fields]) => {
            res.render('researchers.ejs', {
                pageTitle: "Researchers",
                researchers: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}


/* Controller to delete researchers by ID from database */
exports.postDeleteResearchers = (req, res, next) => {
    /* get id from params */
    const id = req.params.id;
    
    /* create the connection, execute query and redirect */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM researchers WHERE researcher_id = ${id}`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/researchers');
        })
        .catch(err => {
            res.redirect('/researchers');
        })
    })

}

/* Controller to create a new researchers in the database */
exports.postAddResearchers = (req, res, next) => {

    /* get necessary data sent */
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;
    const gender = req.body.gender;
    const birth_date = req.body.birth_date;
    const email = req.body.email;

    /* create the connection, execute query, and redirect*/
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO researchers(first_name, last_name, gender, birth_date, email) VALUES(?, ?, ?, ?, ?)`;

        conn.promise().query(sqlQuery, [first_name, last_name, gender, birth_date, email])
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/researchers');
        })
        .catch(err => {
            res.redirect('/researchers');
        })
    })
}


/* Controller to update a researchers in the database */
exports.postUpdateResearchers = (req, res, next) => {

    /* get necessary data sent */
    const researcher_id = req.body.researcher_id;
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;
    const gender = req.body.v;
    const birth_date = req.body.birth_date;
    const email = req.body.email;

    /* create the connection, execute query and redirect */
    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE researchers SET first_name = ?, last_name = ?, gender = ?, birth_date = ?, email = ? WHERE researcher_id = ${researcher_id}`;

        conn.promise().query(sqlQuery, [first_name, last_name, gender, birth_date, email])
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/researchers');
        })
        .catch(err => {
            res.redirect('/researchers');
        })
    })
}