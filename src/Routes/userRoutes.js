const express = require('express');
const router = express.Router();

const userController = require("../Controllers/userController");


const { requireAuth } = require("../Middleware/Auth");

router.post('/register', userController.register);
router.post('/login', userController.login);
router.get('/getUser', requireAuth, userController.getUsers);
router.get('/getUser/:id', requireAuth, userController.getUser);
router.get('/permissions', requireAuth, userController.GetAllPermissions);
router.get('/status', requireAuth, userController.GetAllStatuses);
router.put('/getUser/:id/edit', requireAuth, userController.editUser);
router.put('/getUser/:id/adminEdit', requireAuth, userController.AdminEditUser);
router.delete('/getUser/:id/delete', requireAuth, userController.DeleteUser);
router.get('/refresh-token', userController.refreshToken);

module.exports = router;