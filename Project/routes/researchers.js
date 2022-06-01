const express = require('express');
const researchersController = require('../controllers/researchers');

const router = express.Router();

router.get('/', researchersController.getResearchers);                      //done
router.post('/delete/:id', researchersController.postDeleteResearchers);    //done
router.post('/update/:researcher_id', researchersController.postUpdateResearchers);    //ongoing
router.post('/add', researchersController.postAddResearchers);              //done


module.exports = router;