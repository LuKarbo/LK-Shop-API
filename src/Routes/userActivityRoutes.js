const express = require('express');
const router = express.Router();
const userActivityController = require("../Controllers/userActivityController");
const { requireAuth } = require("../Middleware/Auth");

router.get('/purchases', requireAuth, userActivityController.getAllPurchases);
router.get('/purchases/:userId', requireAuth, userActivityController.getUserPurchases);
router.post('/purchase', requireAuth, userActivityController.purchaseGame);
router.post('/refund', requireAuth, userActivityController.refundGame);

router.get('/library/:userId', requireAuth, userActivityController.getUserLibrary);

module.exports = router;