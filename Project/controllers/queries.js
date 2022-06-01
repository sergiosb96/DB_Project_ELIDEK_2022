const { pool } = require('../utils/database');

/* Controller to retrieve Query 1 from database */
exports.getQuery1 = (req, res, next) => {}


/* Controller to retrieve Query 2a from database */
exports.getQuery2a = (req, res, next) => {}


/* Controller to retrieve Query 2b from database */
exports.getQuery2b = (req, res, next) => {}

/* Controller to retrieve Query 3 from database */
exports.getQuery3 = (req, res, next) => {}

/* Controller to retrieve Query 4 from database */
exports.getQuery4 = (req, res, next) => {}

/* Controller to retrieve Query 5 from database */
exports.getQuery5 = (req, res, next) => {}

/* Controller to retrieve Query 6 from database */
exports.getQuery6 = (req, res, next) => {}

/* Controller to retrieve Query 7 from database */
exports.getQuery7 = (req, res, next) => {}

/* Controller to retrieve Query 8 from database */
/*exports.getQuery8 = (req, res, next) => {

    let Researcher_Name, Total_Projects

    /* create the connection, execute query, render data */
 /*   pool.getConnection((err, conn) => {
        let Researcher_Promise = new Promise((resolve, reject) => {})
        conn.promise()
        .query(`SELECT CONCAT(Researchers.first_name, ' ' , Researchers.last_name) AS Researcher_Name, COUNT(working.project_id) AS Total_Projects FROM Researchers INNER JOIN Working ON Researchers.researcher_id = Working.researcher_id INNER JOIN Projects ON Working.project_id = Projects.project_id LEFT JOIN Deliverables ON Projects.project_id = Deliverables.project_id  WHERE deliverables.date IS NULL GROUP BY Researcher_Name ASC HAVING Total_Projects >= 5;`)
        .then(([rows, fields]) => {
            Researcher_Name = rows.Researcher_Name
            Total_Projects = rows.Total_Projects
            res.render('3_8.ejs', {
                pageTitle: "Query 3.8 Page",
                researchers: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}
*/



exports.getQuery8 = (req, res, next) => {

    let Researcher_Name, Total_Projects;

    /* create the connection */
    pool.getConnection((err, conn) => {

        /* execute query to get best dribbler */
        let ResearcherPromise = new Promise((resolve, reject) => {
            conn.promise()
            .query(`SELECT CONCAT(Researchers.first_name, ' ' , Researchers.last_name) AS Researcher_Name, COUNT(working.project_id) AS Total_Projects FROM Researchers INNER JOIN Working ON Researchers.researcher_id = Working.researcher_id INNER JOIN Projects ON Working.project_id = Projects.project_id LEFT JOIN Deliverables ON Projects.project_id = Deliverables.project_id  WHERE deliverables.date IS NULL GROUP BY Researcher_Name ASC HAVING Total_Projects >= 5;`)
            .then(([rows, fields]) => {
                Researcher_Name = rows[0].Researcher_Name;
                Total_Projects = rows[0].Total_Projects;
                resolve();
             })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
        })

        /* when queries promises finish render respective data */
        Promise.all([ResearcherPromise]).then(() => {
            res.render('3_8.ejs', {
                pageTitle: "Query 3.8 Page",
                Researcher_Name,
                Total_Projects
            })
        });

    })
}