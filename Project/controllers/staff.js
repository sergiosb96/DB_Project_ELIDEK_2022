const { pool } = require('../utils/database');

/* Controller to retrieve staff from database */
exports.getStaff = (req, res, next) => {

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM staff')
        .then(([rows, fields]) => {
            res.render('staff.ejs', {
                pageTitle: "Staff",
                staff: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}


/* Controller to create a new staff in the database */
exports.postAddStaff = (req, res, next) => {

    /* get necessary data sent */
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;
    const email = req.body.email;
    const department = req.body.department;

    /* create the connection, execute query, and redirect*/
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO staff(first_name, last_name, email, department) VALUES(?, ?, ?, ?, ?)`;

        conn.promise().query(sqlQuery, [first_name, last_name, email, department])
        .then(() => {
            pool.releaseConnection(conn);
            res.redirect('/staff');
        })
        .catch(err => {
            res.redirect('/staff');
        })
    })
}
