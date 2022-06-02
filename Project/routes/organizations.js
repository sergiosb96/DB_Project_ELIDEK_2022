const express = require('express');
const organizationsController = require('../controllers/organizations');

const router = express.Router();

router.get('/', organizationsController.getOrganizations);
router.post('/delete/:id', organizationsController.postDeleteOrganizations);
router.post('/update/:organization_id', organizationsController.postUpdateOrganizations);
router.post('/add', organizationsController.postAddOrganizations);


module.exports = router;