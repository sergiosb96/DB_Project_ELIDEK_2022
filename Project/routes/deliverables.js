const express = require('express');
const deliverablesController = require('../controllers/deliverables');

const router = express.Router();

router.get('/', deliverablesController.getDeliverables);
router.post('/add', deliverablesController.postAddDeliverables);


module.exports = router;