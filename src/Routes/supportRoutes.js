const express = require('express');
const router = express.Router();
const supportController = require("../Controllers/supportController");
const { requireAuth } = require("../Middleware/Auth");

router.get('/support', requireAuth, supportController.getAll);
router.get('/support/:id', requireAuth, supportController.getById);
router.post('/support', requireAuth, supportController.create);
router.put('/support/:id/reply', requireAuth, supportController.reply);

module.exports = router;
