const express = require('express');
const router = express.Router();
const discountController = require("../Controllers/discountController");
const { requireAuth } = require("../Middleware/Auth");

router.get('/discount', requireAuth, discountController.getAll);
router.get('/discount/:id', requireAuth, discountController.getById);
router.post('/discount', requireAuth, discountController.create);
router.put('/discount/:id/edit', requireAuth, discountController.edit);

module.exports = router;