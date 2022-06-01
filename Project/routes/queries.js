const express = require('express');
const queriesController = require('../controllers/queries');

const router = express.Router();

router.get('/3_1', queriesController.getQuery1);
router.get('/3_2a', queriesController.getQuery2a);
router.get('/3_2b', queriesController.getQuery2b);
router.get('/3_3', queriesController.getQuery3);
router.get('/3_4', queriesController.getQuery4);
router.get('/3_5', queriesController.getQuery5);
router.get('/3_6', queriesController.getQuery6);
router.get('/3_7', queriesController.getQuery7);
router.get('/3_8', queriesController.getQuery8);

module.exports = router;