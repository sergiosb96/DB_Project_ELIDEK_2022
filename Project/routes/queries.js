const express = require('express');
const queriesController = require('../controllers/queries');

const router = express.Router();

router.get('/1a', queriesController.getQuery1a);
router.get('/1b', queriesController.getQuery1b);
router.get('/1c', queriesController.getQuery1c);
router.get('/2a', queriesController.getQuery2a);
router.get('/2b', queriesController.getQuery2b);
router.get('/3', queriesController.getQuery3);
router.get('/4', queriesController.getQuery4);
router.get('/5', queriesController.getQuery5);
router.get('/6', queriesController.getQuery6);
router.get('/7', queriesController.getQuery7);
router.get('/8', queriesController.getQuery8);

module.exports = router;