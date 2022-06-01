const express = require('express');
const organizationsController = require('../controllers/organizations');

const router = express.Router();

router.get('/', organizationsController.getOrganizations);                      //done
router.post('/delete/:id', organizationsController.postDeleteOrganizations);    //done
router.post('/update/:organization_id', organizationsController.postUpdateOrganizations);    //ongoing
router.post('/add', organizationsController.postAddOrganizations);              //done


module.exports = router;