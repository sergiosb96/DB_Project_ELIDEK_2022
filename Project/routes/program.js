const express = require('express');
const programController = require('../controllers/program');

const router = express.Router();

router.get('/', programController.getProgram);                      //done
router.post('/add', programController.postAddProgram);              //done


module.exports = router;