const express = require('express');
const path = require('path');


require('custom-env').env('localhost');

/* ROUTES and how to import routes */

const layout = require('./routes/layout');
const organizations = require('./routes/organizations');
const projects = require('./routes/projects');
const researchers = require('./routes/researchers');
const program = require('./routes/program');
const deliverables = require('./routes/deliverables');
const staff = require('./routes/staff');
const queries = require('./routes/queries');

/* end of ROUTES and how to import routes */

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', 'views');


/* Routes used by the project */

app.use('/', layout);
app.use('/organizations', organizations);
app.use('/projects', projects);
app.use('/researchers', researchers);
app.use('/program', program);
app.use('/deliverables', deliverables);
app.use('/staff', staff);
app.use('/queries', queries);

/* End of routes used by the project */

// In case of an endpoint does not exist must return 404.html
app.use((req, res, next) => { res.status(404).render('404.ejs', { pageTitle: '404' }) })

module.exports = app;