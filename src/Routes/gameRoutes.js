const express = require('express');
const router = express.Router();
const gameController = require("../Controllers/gameController");
const { requireAuth } = require("../Middleware/Auth");

router.get('/games/user/:userId', requireAuth, gameController.getUserGames);
router.get('/games', requireAuth, gameController.getAllGames);
router.post('/games', requireAuth, gameController.createGame);
router.put('/games/:id', requireAuth, gameController.editGame);
router.delete('/games/:id', requireAuth, gameController.deleteGame);

router.get('/favorites/:userId', requireAuth, gameController.getUserFavorites);
router.post('/favorites', requireAuth, gameController.addToFavorites);
router.delete('/favorites/:userId/:gameId', requireAuth, gameController.removeFromFavorites);

module.exports = router;