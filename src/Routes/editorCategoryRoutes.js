const express = require('express');
const router = express.Router();
const editorCategoryController = require("../Controllers/editorCategoryController");

router.get('/categories', editorCategoryController.getAllCategories);
router.get('/editors', editorCategoryController.getAlleditors);

module.exports = router;