const express = require('express');
const staffController = require('../controllers/staff');

const router = express.Router();

router.get('/', staffController.getStaff);                      //done
router.post('/add', staffController.postAddStaff);              //done


module.exports = router;