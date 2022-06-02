const express = require('express');
const researchersController = require('../controllers/researchers');

const router = express.Router();

router.get('/', researchersController.getResearchers);
router.post('/delete/:id', researchersController.postDeleteResearchers);
router.post('/update/:researcher_id', researchersController.postUpdateResearchers);
router.post('/add', researchersController.postAddResearchers);


module.exports = router;