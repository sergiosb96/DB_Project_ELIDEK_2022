const express = require('express');
const evaluatingController = require('../controllers/evaluating');

const router = express.Router();

router.get('/', evaluatingController.getEvaluating);
router.post('/add', evaluatingController.postAddEvaluating);


module.exports = router;