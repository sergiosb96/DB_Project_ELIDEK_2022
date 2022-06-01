const { pool } = require('../utils/database');

/* Controller to retrieve deliverables from database */
exports.getDeliverables = (req, res, next) => {

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM deliverables')
        .then(([rows, fields]) => {
            res.render('deliverables.ejs', {
                pageTitle: "Deliverables",
                deliverables: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}



/* Controller to create a new deliverables in the database */
exports.postAddDeliverables = (req, res, next) => {

    /* get necessary data sent */
    const title = req.body.title;
    const summary = req.body.summary;
    const date = req.body.date;
    const project_id = req.body.project_id;

    /* create the connection, execute query, and redirect*/
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO deliverables(title, summary, date, project_id) VALUES(?, ?, ?, ?)`;

        conn.promise().query(sqlQuery, [title, summary, date, project_id])
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/deliverables');
        })
        .catch(err => {
            res.redirect('/deliverables');
        })
    })
}