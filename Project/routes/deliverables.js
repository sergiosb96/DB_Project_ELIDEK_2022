const express = require('express');
const deliverablesController = require('../controllers/deliverables');

const router = express.Router();

router.get('/', deliverablesController.getDeliverables);                      //done
router.post('/add', deliverablesController.postAddDeliverables);              //done


module.exports = router;