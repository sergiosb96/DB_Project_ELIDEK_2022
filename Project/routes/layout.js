const express = require('express');
const layoutController = require('../controllers/layout');

const router = express.Router();

router.get('/', layoutController.getLanding);
router.get('/organizations-add', layoutController.getCreateOrganizations)


module.exports = router;