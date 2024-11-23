const connection = require('../../db');

exports.getAll = async () => {
    const query = `CALL SearchAllUserQueries();`;
    try {
        const [results] = await connection.query(query);
        return results[0] || [];
    } catch (error) {
        throw new Error(`Error al obtener consultas: ${error.message}`);
    }
};

exports.getById = async (id) => { 
    const query = `CALL SearchUserQueries(?);`;
    try {
        const [results] = await connection.query(query, [id]);
        return results[0] || null;
    } catch (error) {
        throw new Error(`Error al obtener consulta: ${error.message}`);
    }
};

exports.create = async ({ id_user, title, content }) => {
    const query = `CALL CreateUserQuery(?, ?, ?)`;
    try {
        const [result] = await connection.query(query, [id_user, title, content]);
        return { 
            success: true, 
            message: "Consulta creada correctamente",
            data: result[0] 
        };
    } catch (error) {
        if (error.sqlState === '45000') {
            return { success: false, message: error.sqlMessage };
        }
        throw new Error(`Error al crear consulta: ${error.message}`);
    }
};

exports.reply = async (id, id_admin, response) => {
    const query = `CALL RespondToUserQuery(?, ?, ?)`;
    try {
        await connection.query(query, [id, id_admin, response]);
        return { 
            success: true, 
            message: "Consulta respondida correctamente" 
        };
    } catch (error) {
        throw new Error(`Error al responder consulta: ${error.message}`);
    }
};