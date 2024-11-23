const connection = require('../../db');

exports.getAll = async () => {
    const query = `CALL GetAllDiscountCodes();`;
    try {
        const [results] = await connection.query(query);
        return results[0] || [];
    } catch (error) {
        throw new Error(`Error al obtener los descuentos: ${error.message}`);
    }
};

exports.getById = async (id) => { 
    const query = `CALL GetDiscountCode(?);`;
    try {
        const [results] = await connection.query(query, [id]);
        return results[0] || null;
    } catch (error) {
        throw new Error(`Error al obtener el descuento: ${error.message}`);
    }
};

exports.create = async ({ code,  fecha_creacion, fecha_finalizacion, porcentaje }) => {
    const query = `CALL CreateDiscountCode(?, ?, ?, ?, ?)`;
    try {
        const [result] = await connection.query(query, [code, 1, fecha_creacion, fecha_finalizacion, porcentaje]);
        return { 
            success: true, 
            message: "Descuento creado correctamente",
            data: result[0] 
        };
    } catch (error) {
        if (error.sqlState === '45000') {
            return { success: false, message: error.sqlMessage };
        }
        throw new Error(`Error al crear el Descuento: ${error.message}`);
    }
};

exports.edit = async (id, code, id_status, fecha_creacion, fecha_finalizacion, porcentaje) => {
    const query = `CALL EditDiscountCode(?, ?, ?, ?, ?, ?)`;
    try {
        await connection.query(query, [id, code, id_status, fecha_creacion, fecha_finalizacion, porcentaje]);
        return { 
            success: true, 
            message: "Descuento editado correctamente" 
        };
    } catch (error) {
        throw new Error(`Error al editar el descuento: ${error.message}`);
    }
};