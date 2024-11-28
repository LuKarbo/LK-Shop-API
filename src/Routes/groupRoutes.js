const express = require('express');
const router = express.Router();
const groupController = require("../Controllers/groupController");
const { requireAuth } = require("../Middleware/Auth");

router.get('/groups', groupController.getAllGroups);
router.get('/groups/user/:userId', requireAuth, groupController.getUserGroups);
router.get('/groups/:groupId/messages', requireAuth, groupController.getGroupMessages);
router.post('/groups', requireAuth, groupController.createGroup);
router.post('/groups/:groupId/messages', requireAuth, groupController.sendMessage);
router.put('/groups/:groupId/leave', requireAuth, groupController.leaveGroup);
router.put('/groups/:groupId', requireAuth, groupController.editGroup);
router.delete('/groups/:groupId', requireAuth, groupController.deleteGroup);
router.post('/groups/:groupId/join', requireAuth, groupController.joinGroup);

module.exports = router;