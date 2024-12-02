const review = require("../Models/reviewModel.js");

exports.getAll = async (req, res) => {
    try {
        const reviewData = await review.getAll();
        return res.status(200).json({
            success: true,
            data: reviewData
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al obtener las reseñas',
            error: error.message
        });
    }
};

exports.getUserReviews = async (req, res) => {
    try {
        const { userId } = req.params;
        const reviewData = await review.getUserReviews(userId);
        if (!reviewData.length) {
            return res.status(404).json({
                success: false,
                message: 'No se encontraron reseñas para este usuario'
            });
        }

        return res.status(200).json({
            success: true,
            data: reviewData
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al obtener las reseñas del usuario',
            error: error.message
        });
    }
};

exports.create = async (req, res) => {
    const { userId, gameId, content, score } = req.body;

    if (!userId || !gameId || !content || !score) {
        return res.status(400).json({
            success: false,
            message: 'userId, gameId, content y score son campos requeridos'
        });
    }

    if (score < 0 || score > 10) {
        return res.status(400).json({
            success: false,
            message: 'El puntaje debe estar entre 0 y 10'
        });
    }

    try {
        const result = await review.create({ userId, gameId, content, score });
        return res.status(201).json(result);
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Error al crear la reseña',
            error: error.message
        });
    }
};