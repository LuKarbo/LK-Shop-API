const connection = require('../../db');

exports.refundGame = async (userId, gameId) => {
    const query = `CALL RefundGame(?, ?);`;
    try {
        const [results] = await connection.query(query, [userId, gameId]);
        return {
            success: results[0][0].result === 'Game refunded successfully',
            message: results[0][0].result
        };
    } catch (error) {
        throw new Error(`Error al reembolsar el juego: ${error.message}`);
    }
};

exports.getAllPurchases = async () => {
    const query = `CALL GetAllPurchases();`;
    try {
        const [results] = await connection.query(query);
        return results[0] || [];
    } catch (error) {
        throw new Error(`Error al obtener las compras: ${error.message}`);
    }
};

exports.getUserPurchases = async (userId) => {
    const query = `CALL GetUserPurchases(?);`;
    try {
        const [results] = await connection.query(query, [userId]);
        return results[0] || [];
    } catch (error) {
        throw new Error(`Error al obtener las compras del usuario: ${error.message}`);
    }
};

exports.purchaseGame = async (userId, gameId) => {
    const query = `CALL PurchaseGame(?, ?);`;
    try {
        const [results] = await connection.query(query, [userId, gameId]);
        return {
            success: results[0][0].result === 'Game purchased successfully',
            message: results[0][0].result
        };
    } catch (error) {
        throw new Error(`Error al comprar el juego: ${error.message}`);
    }
};

exports.getUserLibrary = async (userId) => {
    const query = `CALL GetUserLibrary(?);`;
    try {
        const [results] = await connection.query(query, [userId]);
        return results[0] || [];
    } catch (error) {
        throw new Error(`Error al obtener la biblioteca del usuario: ${error.message}`);
    }
};