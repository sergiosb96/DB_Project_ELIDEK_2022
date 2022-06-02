const { pool } = require('../utils/database');

/* Controller to retrieve deliverables from database */
exports.getEvaluating = (req, res, next) => {

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM evaluating')
        .then(([rows, fields]) => {
            res.render('evaluating.ejs', {
                pageTitle: "Evaluating",
                evaluating: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}



/* Controller to create a new deliverables in the database */
exports.postAddEvaluating = (req, res, next) => {

    /* get necessary data sent */
    const grade = req.body.grade;
    const date = req.body.date;
    const researcher_id = req.body.researcher_id;
    const project_id = req.body.project_id;

    /* create the connection, execute query, and redirect*/
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO evaluating(grade, date, researcher_id, project_id) VALUES(?, ?, ?, ?)`;

        conn.promise().query(sqlQuery, [grade, date, researcher_id, project_id])
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/evaluating');
        })
        .catch(err => {
            res.redirect('/evaluating');
        })
    })
}