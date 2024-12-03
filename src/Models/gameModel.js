const connection = require('../../db');

exports.getUserGames = async (userId) => {
    const query = `CALL GetUserGames(?)`;
    try {
        const [result] = await connection.query(query, [userId]);
        return {
            success: true,
            data: result[0]
        };
    } catch (error) {
        throw new Error(`Error al obtener los juegos del usuario: ${error.message}`);
    }
};

exports.getAllGames = async () => {
    const query = `CALL GetAllGames()`;
    try {
        const [result] = await connection.query(query);
        return {
            success: true,
            data: result[0]
        };
    } catch (error) {
        throw new Error(`Error al obtener el inventario de juegos: ${error.message}`);
    }
};

exports.createGame = async ({
    titulo, descripcion, banner, fecha, precio, discount_id, puntaje, editor_id, copias_disponibles, total_copias, categorias
}) => {
    const query = `CALL CreateNewGame(?,?,?,?,?,?,?,?,?,?,?)`;
    try {
        const categoriasStr = categorias.join(',');
        const [result] = await connection.query(query, [
            titulo, descripcion, banner, fecha, precio, discount_id, puntaje, editor_id, copias_disponibles, total_copias, categoriasStr
        ]);
        return {
            success: true,
            message: "Juego creado correctamente",
            data: result[0]
        };
    } catch (error) {
        throw new Error(`Error al crear el juego: ${error.message}`);
    }
};


exports.editGame = async (
    id, nombre, descripcion, gameBanner, fecha_lanzamiento,
    precio, descuento, puntaje, id_editor,
    copias_disponibles, copias_cantidad
) => {
    const query = `CALL EditGame(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    try {
        const [result] = await connection.query(query, [
            id, nombre, descripcion, gameBanner, fecha_lanzamiento,
            precio, descuento, puntaje, id_editor,
            copias_disponibles, copias_cantidad
        ]);
        return {
            success: true,
            message: "Juego actualizado correctamente",
            data: result[0]
        };
    } catch (error) {
        if (error.sqlState === '45000') {
            throw new Error(error.sqlMessage);
        }
        throw new Error(`Error al editar el juego: ${error.message}`);
    }
};

exports.deleteGame = async (id) => {
    const query = `CALL DeleteGame(?)`;
    try {
        const [result] = await connection.query(query, [id]);
        return {
            success: true,
            message: "Juego eliminado correctamente",
            data: result[0]
        };
    } catch (error) {
        if (error.sqlState === '45000') {
            throw new Error(error.sqlMessage);
        }
        throw new Error(`Error al eliminar el juego: ${error.message}`);
    }
};

exports.getUserFavorites = async (userId) => {
    const query = `CALL GetUserFavorites(?)`;
    try {
        const [result] = await connection.query(query, [userId]);
        return {
            success: true,
            data: result[0]
        };
    } catch (error) {
        throw new Error(`Error al obtener los juegos favoritos: ${error.message}`);
    }
};

exports.addToFavorites = async (userId, gameId) => {
    const query = `CALL AddGameToFavorites(?, ?)`;
    try {
        const [result] = await connection.query(query, [userId, gameId]);
        return {
            success: true,
            message: result[0].result
        };
    } catch (error) {
        throw new Error(`Error al añadir el juego a favoritos: ${error.message}`);
    }
};

exports.removeFromFavorites = async (userId, gameId) => {
    const query = `CALL RemoveGameFromFavorites(?, ?)`;
    try {
        const [result] = await connection.query(query, [userId, gameId]);
        return {
            success: true,
            message: result[0].result
        };
    } catch (error) {
        throw new Error(`Error al remover el juego de favoritos: ${error.message}`);
    }
};