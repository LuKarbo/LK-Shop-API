const express = require('express');
const router = express.Router();
const reviewController = require("../Controllers/reviewController");
const { requireAuth } = require("../Middleware/Auth");

router.get('/review', requireAuth, reviewController.getAll);
router.get('/review/user/:userId', requireAuth, reviewController.getUserReviews);
router.post('/review', requireAuth, reviewController.create);

module.exports = router;