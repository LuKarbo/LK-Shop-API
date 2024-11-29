const group = require("../Models/groupModel");

exports.getAllGroups = async (req, res) => {
    try {
        const groups = await group.getAllGroups();
        return res.status(200).json({
            success: true,
            data: groups
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al obtener grupos',
            error: error.message
        });
    }
};

exports.getUserGroups = async (req, res) => {
    try {
        const { userId } = req.params;
        const groups = await group.getUserGroups(userId);
        return res.status(200).json({
            success: true,
            data: groups
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al obtener grupos del usuario',
            error: error.message
        });
    }
};

exports.getGroupMessages = async (req, res) => {
    try {
        const { groupId } = req.params;
        const messages = await group.getGroupMessages(groupId);
        return res.status(200).json({
            success: true,
            data: messages
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al obtener mensajes del grupo',
            error: error.message
        });
    }
};

exports.createGroup = async (req, res) => {
    try {
        const { name, description, groupBanner, ownerId, categories } = req.body;

        if (!name || !ownerId) {
            return res.status(400).json({
                success: false,
                message: 'Nombre y ownerId son campos requeridos'
            });
        }

        const result = await group.createGroup(name, description, groupBanner, ownerId, categories);
        return res.status(201).json({
            success: true,
            message: 'Grupo creado correctamente',
            data: result
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al crear el grupo',
            error: error.message
        });
    }
};

exports.sendMessage = async (req, res) => {
    try {
        const { groupId } = req.params;
        const { userId, message } = req.body;

        if (!userId || !message) {
            return res.status(400).json({
                success: false,
                message: 'userId y message son campos requeridos'
            });
        }

        const result = await group.sendMessage(groupId, userId, message);
        return res.status(201).json({
            success: true,
            message: 'Mensaje enviado correctamente',
            data: result
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al enviar el mensaje',
            error: error.message
        });
    }
};

exports.leaveGroup = async (req, res) => {
    try {
        const { groupId } = req.params;
        const { userId } = req.body;

        if (!userId) {
            return res.status(400).json({
                success: false,
                message: 'userId es requerido'
            });
        }

        const result = await group.leaveGroup(userId, groupId);
        return res.status(200).json(result);
    } catch (error) {
        if (error.sqlState === '45000') {
            return res.status(400).json({
                success: false,
                message: error.sqlMessage
            });
        }
        return res.status(500).json({
            success: false,
            message: 'Error al abandonar el grupo',
            error: error.message
        });
    }
};

exports.editGroup = async (req, res) => {
    try {
        const { groupId } = req.params;
        const { name, groupImg, groupBanner } = req.body;

        if (!name && !groupImg && !groupBanner) {
            return res.status(400).json({
                success: false,
                message: 'Se requiere al menos un campo para actualizar'
            });
        }

        const result = await group.editGroup(groupId, name, groupImg, groupBanner);
        return res.status(200).json({
            success: true,
            message: 'Grupo actualizado correctamente',
            data: result
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al editar el grupo',
            error: error.message
        });
    }
};

exports.deleteGroup = async (req, res) => {
    try {
        const { groupId } = req.params;
        await group.deleteGroup(groupId);
        return res.status(200).json({
            success: true,
            message: 'Grupo eliminado correctamente'
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al eliminar el grupo',
            error: error.message
        });
    }
};

exports.joinGroup = async (req, res) => {
    try {
        const { groupId } = req.params;
        const { userId } = req.body;

        if (!userId) {
            return res.status(400).json({
                success: false,
                message: 'userId es requerido'
            });
        }

        const result = await group.joinGroup(groupId, userId);
        return res.status(200).json({
            success: true,
            message: 'Usuario se ha unido al grupo correctamente',
            data: result
        });
    } catch (error) {
        if (error.sqlState === '45000') {
            return res.status(400).json({
                success: false,
                message: error.sqlMessage
            });
        }
        return res.status(500).json({
            success: false,
            message: 'Error al unirse al grupo',
            error: error.message
        });
    }
};