const connection = require('../../db');

exports.getAll = async () => {
    const query = `CALL GetAllReviews();`;
    try {
        const [results] = await connection.query(query);
        return results[0] || [];
    } catch (error) {
        throw new Error(`Error al obtener las reseñas: ${error.message}`);
    }
};

exports.getUserReviews = async (userId) => {
    const query = `CALL GetUserReviews(?);`;
    try {
        const [results] = await connection.query(query, [userId]);
        return results[0] || [];
    } catch (error) {
        throw new Error(`Error al obtener las reseñas del usuario: ${error.message}`);
    }
};

exports.create = async ({ userId, gameId, content, score }) => {
    const query = `CALL CreateReviewAndUpdateLibrary(?, ?, ?, ?)`;
    try {
        const [result] = await connection.query(query, [userId, gameId, content, score]);
        return {
            success: true,
            message: "Reseña creada correctamente",
            data: result[0]
        };
    } catch (error) {
        if (error.sqlState === '45000') {
            return { success: false, message: error.sqlMessage };
        }
        throw new Error(`Error al crear la reseña: ${error.message}`);
    }
};