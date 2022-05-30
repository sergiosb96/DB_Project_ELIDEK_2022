const express = require('express');
const organizationsController = require('../controllers/organizations');

const router = express.Router();

router.get('/', organizationsController.getOrganizations);                      //working
router.post('/delete/:id', organizationsController.postDeleteOrganizations);    //working
router.post('/update/:id', organizationsController.postUpdateOrganizations);    //ongoing
router.post('/add', organizationsController.postAddOrganizations);              //ongoing


module.exports = router;