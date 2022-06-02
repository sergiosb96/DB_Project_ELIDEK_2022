const express = require('express');
const programController = require('../controllers/program');

const router = express.Router();

router.get('/', programController.getProgram);
router.post('/add', programController.postAddProgram);


module.exports = router;