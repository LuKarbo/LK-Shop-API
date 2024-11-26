const express = require('express');
const router = express.Router();

const userController = require("../Controllers/userController");


const { requireAuth } = require("../Middleware/Auth");

router.post('/register', userController.register);
router.post('/login', userController.login);
router.get('/getUser', requireAuth, userController.getUsers);
router.get('/getUser/:id', requireAuth, userController.getUser);
router.put('/getUser/:id/edit', requireAuth, userController.editUser);
router.get('/refresh-token', userController.refreshToken);

module.exports = router;