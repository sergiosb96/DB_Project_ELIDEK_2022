const express = require('express');
const projectsController = require('../controllers/projects');

const router = express.Router();

router.get('/', projectsController.getProjects);
router.post('/delete/:id', projectsController.postDeleteProjects);
router.post('/update/:project_id', projectsController.postUpdateProjects);
router.post('/add', projectsController.postAddProjects);


module.exports = router;