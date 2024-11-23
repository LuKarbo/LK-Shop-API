const connection = require('../../db');

exports.getAllGroups = async () => {
    const query = `CALL GetGroupsWithMemberCount();`;
    try {
        const [results] = await connection.query(query);
        return results[0] || [];
    } catch (error) {
        throw new Error(`Error al obtener grupos: ${error.message}`);
    }
};

exports.getUserGroups = async (userId) => {
    const query = `CALL GetUserGroups(?);`;
    try {
        const [results] = await connection.query(query, [userId]);
        return results[0] || [];
    } catch (error) {
        throw new Error(`Error al obtener grupos del usuario: ${error.message}`);
    }
};

exports.getGroupMessages = async (groupId) => {
    const query = `CALL GetGroupMessages(?);`;
    try {
        const [results] = await connection.query(query, [groupId]);
        return results[0] || [];
    } catch (error) {
        throw new Error(`Error al obtener mensajes del grupo: ${error.message}`);
    }
};

exports.createGroup = async (name, groupImg, groupBanner, ownerId) => {
    const query = `CALL CreateGroup(?, ?, ?, ?);`;
    try {
        const [result] = await connection.query(query, [name, groupImg, groupBanner, ownerId]);
        return {
            success: true,
            message: "Grupo creado correctamente",
            data: result[0]
        };
    } catch (error) {
        throw new Error(`Error al crear grupo: ${error.message}`);
    }
};

exports.sendMessage = async (groupId, userId, message) => {
    const query = `CALL SendGroupMessage(?, ?, ?);`;
    try {
        await connection.query(query, [groupId, userId, message]);
        return {
            success: true,
            message: "Mensaje enviado correctamente"
        };
    } catch (error) {
        throw new Error(`Error al enviar mensaje: ${error.message}`);
    }
};

exports.leaveGroup = async (userId, groupId) => {
    const query = `CALL LeaveGroup(?, ?);`;
    try {
        await connection.query(query, [userId, groupId]);
        return {
            success: true,
            message: "Usuario ha abandonado el grupo correctamente"
        };
    } catch (error) {
        throw error;
    }
};

exports.editGroup = async (groupId, name, groupImg, groupBanner) => {
    const query = `CALL EditGroup(?, ?, ?, ?);`;
    try {
        await connection.query(query, [groupId, name, groupImg, groupBanner]);
        return {
            success: true,
            message: "Grupo actualizado correctamente"
        };
    } catch (error) {
        throw new Error(`Error al editar grupo: ${error.message}`);
    }
};

exports.deleteGroup = async (groupId) => {
    const query = `CALL DeleteGroup(?);`;
    try {
        await connection.query(query, [groupId]);
        return {
            success: true,
            message: "Grupo eliminado correctamente"
        };
    } catch (error) {
        throw new Error(`Error al eliminar grupo: ${error.message}`);
    }
};

exports.joinGroup = async (groupId, userId) => {
    const query = `CALL JoinGroup(?, ?);`;
    try {
        await connection.query(query, [groupId, userId]);
        return {
            success: true,
            message: "Usuario se ha unido al grupo correctamente"
        };
    } catch (error) {
        throw new Error(`Error al unirse al grupo: ${error.message}`);
    }
};