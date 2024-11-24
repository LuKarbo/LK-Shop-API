const userActivity = require('../Models/userActivityModel.js');

exports.refundGame = async (req, res) => {
    const { userId, gameId } = req.body;

    if (!userId || !gameId) {
        return res.status(400).json({
            success: false,
            message: 'userId y gameId son campos requeridos'
        });
    }

    try {
        const result = await userActivity.refundGame(userId, gameId);
        return res.status(200).json(result);
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al reembolsar el juego',
            error: error.message
        });
    }
};

exports.getAllPurchases = async (req, res) => {
    try {
        const purchases = await userActivity.getAllPurchases();
        return res.status(200).json({
            success: true,
            data: purchases
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al obtener las compras',
            error: error.message
        });
    }
};

exports.getUserPurchases = async (req, res) => {
    try {
        const { userId } = req.params;
        const purchases = await userActivity.getUserPurchases(userId);
        return res.status(200).json({
            success: true,
            data: purchases
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al obtener las compras del usuario',
            error: error.message
        });
    }
};

exports.purchaseGame = async (req, res) => {
    const { userId, gameId } = req.body;

    if (!userId || !gameId) {
        return res.status(400).json({
            success: false,
            message: 'userId y gameId son campos requeridos'
        });
    }

    try {
        const result = await userActivity.purchaseGame(userId, gameId);
        return res.status(201).json(result);
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al comprar el juego',
            error: error.message
        });
    }
};

exports.getUserLibrary = async (req, res) => {
    try {
        const { userId } = req.params;
        const library = await userActivity.getUserLibrary(userId);
        return res.status(200).json({
            success: true,
            data: library
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al obtener la biblioteca del usuario',
            error: error.message
        });
    }
};