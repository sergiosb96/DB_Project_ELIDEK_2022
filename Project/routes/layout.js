const express = require('express');
const layoutController = require('../controllers/layout');

const router = express.Router();

router.get('/', layoutController.getLanding);
router.get('/organizations-add', layoutController.getCreateOrganizations)
router.get('/projects-add', layoutController.getCreateProjects)
router.get('/researchers-add', layoutController.getCreateResearchers)
router.get('/program-add', layoutController.getCreateProgram)
router.get('/staff-add', layoutController.getCreateStaff)
router.get('/deliverables-add', layoutController.getCreateDeliverables)
router.get('/evaluating-add', layoutController.getCreateDeliverables)


module.exports = router;