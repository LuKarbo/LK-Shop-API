const discount = require("../Models/discountModel.js");

exports.getAll = async (req, res) => {
    try {
        const discountData = await discount.getAll();
        return res.status(200).json({
            success: true,
            data: discountData
        });
    } catch (error) {
        return res.status(500).json({ 
            success: false,
            message: 'Error al obtener los descuentos',
            error: error.message 
        });
    }
};

exports.getById = async (req, res) => {
    try {
        const { id } = req.params;
        const discountData = await discount.getById(id);
        
        if (!discountData) {
            return res.status(404).json({ 
                success: false,
                message: 'Discuento no encontrado' 
            });
        }

        return res.status(200).json({
            success: true,
            data: discountData
        });
    } catch (error) {
        return res.status(500).json({ 
            success: false,
            message: 'Error al obtener el descuento',
            error: error.message 
        });
    }
};

exports.create = async (req, res) => {
    const { code,  fecha_creacion, fecha_finalizacion, porcentaje} = req.body;

    if (!code || !fecha_creacion || !fecha_finalizacion || !porcentaje) {
        return res.status(400).json({ 
            success: false, 
            message: 'code,  fecha_creacion, fecha_finalizacion y porcentaje son campos requeridos' 
        });
    }

    try {
        const result = await discount.create({ code,  fecha_creacion, fecha_finalizacion, porcentaje });
        return res.status(201).json(result);
    } catch (error) {
        return res.status(500).json({ 
            success: false, 
            message: 'Error al crear el descuento',
            error: error.message 
        });
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, id_status, fecha_creacion, fecha_finalizacion, porcentaje } = req.body;

    if (!code || !id_status || !fecha_creacion || !fecha_finalizacion || !porcentaje) {
        return res.status(400).json({
            success: false,
            message: 'code, id_status, fecha_creacion, fecha_finalizacion y porcentaje son campos requeridos'
        });
    }

    try {
        const result = await discount.edit(id, code, id_status, fecha_creacion, fecha_finalizacion, porcentaje);
        return res.status(200).json(result);
    } catch (error) {
        return res.status(500).json({ 
            success: false, 
            message: 'Error al responder la consulta',
            error: error.message 
        });
    }
};