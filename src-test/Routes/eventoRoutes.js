// Routes: Definimos las rutas para usar los controladores

const express = require('express');
const router = express.Router();

//Controlador
const eventoController = require('../Controllers/eventoController');
// Rutas del controlador
router.get('/eventos', eventoController.index);
router.post('/eventos', eventoController.store);
router.get('/eventos/:ID', eventoController.show);
router.put('/eventos/:ID', eventoController.update);

module.exports = router;
