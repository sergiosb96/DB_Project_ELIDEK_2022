const { pool } = require('../utils/database');

exports.getQuery = (req, res, next) => {}


/* Controller to retrieve Query 1a from database */
exports.getQuery1a = (req, res, next) => {

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT  DISTINCT Program.Name FROM Program;')
        .then(([rows, fields]) => {
            res.render('1a.ejs', {
                pageTitle: "Query 1a",
                query1a: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}


/* Controller to retrieve Query 1b from database */
exports.getQuery1b = (req, res, next) => {

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query(`SELECT DISTINCT Projects.title, CONCAT(Researchers.first_name, ' ' , Researchers.last_name) AS Researcher FROM Projects INNER JOIN Working ON Projects.project_id = Working.project_id INNER JOIN Researchers ON Researchers.researcher_id = Working.researcher_id;`)
        .then(([rows, fields]) => {
            res.render('1b.ejs', {
                pageTitle: "Query 1b",
                query1b: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}


/* Controller to retrieve Query 1c from database */
exports.getQuery1c = (req, res, next) => {

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query(`SELECT DISTINCT CONCAT(Researchers.first_name, ' ' , Researchers.last_name) AS Full_Name, projects.title AS Working_On, starting_date AS Working_Since, duration AS Project_Duration_In_Days,  CONCAT(Staff.first_name, ' ', Staff.last_name) AS Funded_By FROM Researchers INNER JOIN Working ON Researchers.researcher_id = Working.researcher_id INNER JOIN Projects ON Working.project_id = Projects.project_id INNER JOIN Staff ON Projects.staff_id = Staff.staff_id;`)
        .then(([rows, fields]) => {
            res.render('1c.ejs', {
                pageTitle: "Query 1c",
                query1c: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}


/* Controller to retrieve Query 2a from database */
exports.getQuery2a = (req, res, next) => {

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM researcher_project')
        .then(([rows, fields]) => {
            res.render('2a.ejs', {
                pageTitle: "Query 2a",
                query2a: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}


/* Controller to retrieve Query 2b from database */
exports.getQuery2b = (req, res, next) => {

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM organizations_phonenumbers')
        .then(([rows, fields]) => {
            res.render('2b.ejs', {
                pageTitle: "Query 2b",
                query2b: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to retrieve Query 3 from database */
exports.getQuery3 = (req, res, next) => {

    /* create the connection */
    pool.getConnection((err, conn) => {

        /* execute query  */
            conn.promise().query(`select distinct title,starting_date,ending_date,name,last_name,first_name from (select projects.project_id,title,starting_date,ending_date,name from projects,science_field where projects.project_id=science_field.project_id)as T, (select first_name,last_name,project_id from researchers,working where researchers.researcher_id=working.project_id)as S where T.project_ID=S.project_ID and curdate() BETWEEN starting_date AND ending_date order by name;`)
            .then(([rows, fields]) => {
                res.render('3.ejs', {
                    pageTitle: "Query 3",
                    query3: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
        })
    
}

/* Controller to retrieve Query 4 from database */
exports.getQuery4 = (req, res, next) => {}


    /* create the connection */
/*    pool.getConnection((err, conn) => {

        /* execute query  */
/*            conn.promise().query(``)
            .then(([rows, fields]) => {
                res.render('4.ejs', {
                    pageTitle: "Query 4",
                    query4: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
        })
    
}

*/

/* Controller to retrieve Query 5 from database */
exports.getQuery5 = (req, res, next) => {


    /* create the connection */
    pool.getConnection((err, conn) => {

        /* execute query  */
            conn.promise().query(`select t.name,s.name, COUNT(*) from (select projects.project_id,name from projects,science_field where projects.project_id= science_field.project_id) as T, (select projects.project_id,name  from projects,science_field where projects.project_id= science_field.project_id) as S where T.project_id=S.project_id and T.name<>S.name group by s.name order by count(*) desc limit 3;`)
            .then(([rows, fields]) => {
                res.render('5.ejs', {
                    pageTitle: "Query 5",
                    query5: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
        })
    
}

/* Controller to retrieve Query 6 from database */
exports.getQuery6 = (req, res, next) => {

    /* create the connection */
    pool.getConnection((err, conn) => {

        /* execute query  */
            conn.promise().query(`SELECT CONCAT(Researchers.first_name, ' ' , Researchers.last_name) AS Full_Name, COUNT(Projects.project_id) AS Total_Projects FROM Researchers JOIN Working ON Researchers.researcher_id = Working.researcher_id INNER JOIN  Projects ON Working.project_id = Projects.project_id WHERE birth_date > DATE_SUB(NOW(), INTERVAL 40 year) AND CURDATE() BETWEEN starting_date AND ending_date GROUP BY Full_Name ORDER BY COUNT(Projects.project_id) DESC;`)
            .then(([rows, fields]) => {
                res.render('6.ejs', {
                    pageTitle: "Query 6",
                    query6: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
        })
    
}


/* Controller to retrieve Query 7 from database */
exports.getQuery7 = (req, res, next) => {

    /* create the connection */
    pool.getConnection((err, conn) => {

        /* execute query  */
            conn.promise().query(`select first_name as researcher_first_name,last_name as researcher_last_name,name as organization_name,total_funding from (select name,organizations.organization_id from organizations,companies where organizations.organization_id=companies.organization_id)as S, (select first_name,last_name,projects.staff_id,projects.organization_id,title,project_ID,sum(funding) as total_funding from projects,staff where staff.staff_id=projects.staff_id group by projects.organization_id,projects.staff_id)as T where S.organization_id=T.organization_id order by total_funding desc limit 5;`)
            .then(([rows, fields]) => {
                res.render('7.ejs', {
                    pageTitle: "Query 7",
                    query7: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
        })
    
}


/* Controller to retrieve Query 8 from database */
exports.getQuery8 = (req, res, next) => {


    /* create the connection */
    pool.getConnection((err, conn) => {

        /* execute query  */
            conn.promise().query(`SELECT CONCAT(Researchers.first_name, ' ' , Researchers.last_name) AS Researcher_Name, COUNT(working.project_id) AS Total_Projects FROM Researchers INNER JOIN Working ON Researchers.researcher_id = Working.researcher_id INNER JOIN Projects ON Working.project_id = Projects.project_id LEFT JOIN Deliverables ON Projects.project_id = Deliverables.project_id  WHERE deliverables.date IS NULL GROUP BY Researcher_Name ASC HAVING Total_Projects >= 5;`)
            .then(([rows, fields]) => {
                res.render('8.ejs', {
                    pageTitle: "Query 8",
                    query8: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
        })
    
}