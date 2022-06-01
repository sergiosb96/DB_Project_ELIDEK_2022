const { pool } = require('../utils/database');

/* Controller to retrieve program from database */
exports.getProgram = (req, res, next) => {

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM program')
        .then(([rows, fields]) => {
            res.render('program.ejs', {
                pageTitle: "Program",
                program: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}



/* Controller to create a new program in the database */
exports.postAddProgram = (req, res, next) => {

    /* get necessary data sent */
    const name = req.body.name;
    const department = req.body.department;

    /* create the connection, execute query, and redirect*/
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO program(name, department) VALUES(?, ?, ?)`;

        conn.promise().query(sqlQuery, [name, department])
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/program');
        })
        .catch(err => {
            res.redirect('/program');
        })
    })
}