// Controller: Define la lógica del sistema
const eventoModel = require('../Models/eventoModel');

// GET /eventos - Recupera la lista de todos los eventos
exports.index = async(req, res) => {
    try {
        const results = await eventoModel.all();
        res.json({ success: true, results });
    } catch (error) {
        console.log(error);
        res.status(500).json({ success: false, message: 'Error al intentar recuperar los eventos' });
    }
}

// POST /eventos - Crea un nuevo evento
exports.store = async(req, res) => {
    const { nombre, descripcion, cupo } = req.body; // Datos del evento enviados en el cuerpo de la solicitud
    try {
        await eventoModel.create({ nombre, descripcion, cupo });
        res.json({ success: true, message: 'El evento se ha creado correctamente' });
    } catch (error) {
        console.log(error);
        res.status(500).json({ success: false, message: 'Error al intentar agregar el evento' });
    }
}

// GET /eventos/:ID - Recupera un evento específico por su ID
exports.show = async(req, res) => {
    const { ID } = req.params; // ID del evento pasado como parámetro en la URL
    try {
        const result = await eventoModel.find(ID);
        if (result == null) {
            // El evento con ese ID no existe
            res.status(404).json({ success: false, message: 'El evento no existe o ha dejado de existir' });
        } else {
            res.json({ success: true, result });
        }
    } catch (error) {
        console.log(error);
        res.status(500).json({ success: false, message: 'Error al intentar recuperar el evento' });
    }
}

// PUT /eventos/:ID - Actualiza un evento existente por su ID
exports.update = async(req, res) => {
    const { ID } = req.params; // ID del evento pasado como parámetro en la URL
    const { nombre, descripcion, cupo } = req.body; // Datos actualizados enviados en el cuerpo de la solicitud
    try {
        eventoModel.update({ nombre, descripcion, cupo, ID });
        res.json({ success: true, message: 'El evento se ha modificado correctamente' });
    } catch (error) {
        console.log(error);
        res.status(500).json({ success: false, message: 'Error al intentar actualizar el evento' });
    }
}
