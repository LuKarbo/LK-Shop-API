const game = require("../Models/gameModel");

exports.getUserGames = async (req, res) => {
    const { userId } = req.params;

    if (!userId) {
        return res.status(400).json({
            success: false,
            message: 'El ID del usuario es requerido'
        });
    }

    try {
        const result = await game.getUserGames(userId);
        return res.status(200).json(result);
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al obtener los juegos del usuario',
            error: error.message
        });
    }
};

exports.getAllGames = async (req, res) => {
    try {
        const result = await game.getAllGames();
        return res.status(200).json(result);
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al obtener el inventario de juegos',
            error: error.message
        });
    }
};

exports.createGame = async (req, res) => {
    const {
        titulo, descripcion, banner, fecha, precio, discount_id, puntaje, 
        editor_id, copias_disponibles, total_copias, categorias
    } = req.body;
    
    if (!titulo || !descripcion || !precio || !puntaje || !fecha ||
        !editor_id || !copias_disponibles || !total_copias || 
        !categorias) {
            console.log("Todos los campos obligatorios deben ser proporcionados");
        return res.status(400).json({
            success: false,
            message: 'Todos los campos obligatorios deben ser proporcionados'
        });
    }

    try {
        const result = await game.createGame({
            titulo, descripcion, banner, fecha, precio, discount_id, puntaje, editor_id, copias_disponibles, total_copias, categorias
        });
        return res.status(201).json(result);
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al crear el juego',
            error: error.message
        });
    }
};

exports.editGame = async (req, res) => {
    const { id } = req.params;
    const {
        titulo, descripcion, banner, fecha, precio, discount_id, puntaje, editor_id, copias_disponibles, total_copias, categorias
    } = req.body;

    if (!titulo || !descripcion || !precio || !puntaje || !fecha ||
        !editor_id || !copias_disponibles || !total_copias || 
        !categorias) {
            console.log("Todos los campos obligatorios deben ser proporcionados");
        return res.status(400).json({
            success: false,
            message: 'Todos los campos obligatorios deben ser proporcionados'
        });
    }

    try {
        const result = await game.editGame(
            id, titulo, descripcion, banner, fecha, precio, discount_id, puntaje, editor_id, copias_disponibles, total_copias, categorias
        );
        return res.status(200).json(result);
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al editar el juego',
            error: error.message
        });
    }
};

exports.deleteGame = async (req, res) => {
    const { id } = req.params;
    
    try {
        const result = await game.deleteGame(id);
        return res.status(200).json(result);
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al eliminar el juego',
            error: error.message
        });
    }
};

exports.getUserFavorites = async (req, res) => {
    const { userId } = req.params;

    if (!userId) {
        return res.status(400).json({
            success: false,
            message: 'El ID del usuario es requerido'
        });
    }

    try {
        const result = await game.getUserFavorites(userId);
        return res.status(200).json(result);
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al obtener los juegos favoritos',
            error: error.message
        });
    }
};

exports.addToFavorites = async (req, res) => {
    const { userId, gameId } = req.body;

    if (!userId || !gameId) {
        return res.status(400).json({
            success: false,
            message: 'userId y gameId son campos requeridos'
        });
    }

    try {
        const result = await game.addToFavorites(userId, gameId);
        return res.status(200).json(result);
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al añadir el juego a favoritos',
            error: error.message
        });
    }
};

exports.removeFromFavorites = async (req, res) => {
    const { userId, gameId } = req.params;

    try {
        const result = await game.removeFromFavorites(userId, gameId);
        return res.status(200).json(result);
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al remover el juego de favoritos',
            error: error.message
        });
    }
};