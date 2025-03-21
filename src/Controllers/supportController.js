const support = require("../Models/supportModel.js");

exports.getAll = async (req, res) => {
    try {
        const supportData = await support.getAll();
        return res.status(200).json({
            success: true,
            data: supportData
        });
    } catch (error) {
        return res.status(500).json({ 
            success: false,
            message: 'Error al obtener consultas',
            error: error.message 
        });
    }
};

exports.getById = async (req, res) => {
    try {
        const { id } = req.params;
        const supportData = await support.getById(id);
        
        if (!supportData) {
            return res.status(404).json({ 
                success: false,
                message: 'Consulta no encontrada' 
            });
        }

        return res.status(200).json({
            success: true,
            data: supportData
        });
    } catch (error) {
        return res.status(500).json({ 
            success: false,
            message: 'Error al obtener consulta',
            error: error.message 
        });
    }
};

exports.create = async (req, res) => {
    const { id_user, title, content } = req.body;

    if (!id_user || !title || !content) {
        return res.status(400).json({ 
            success: false, 
            message: 'id_user, title y content son campos requeridos' 
        });
    }

    try {
        const result = await support.create({ id_user, title, content });
        return res.status(201).json(result);
    } catch (error) {
        return res.status(500).json({ 
            success: false, 
            message: 'Error al crear la consulta',
            error: error.message 
        });
    }
};

exports.reply = async (req, res) => {
    const { id } = req.params;
    const { id_admin, response } = req.body;

    if (!id_admin || !response) {
        return res.status(400).json({
            success: false,
            message: 'id_admin y response son campos requeridos'
        });
    }

    try {
        const result = await support.reply(id, id_admin, response);
        return res.status(200).json(result);
    } catch (error) {
        return res.status(500).json({ 
            success: false, 
            message: 'Error al responder la consulta',
            error: error.message 
        });
    }
};