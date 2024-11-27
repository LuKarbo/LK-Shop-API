const connection = require('../../db');

exports.getAllCategories = async () => {
    const query = `Select * From category;`;
    try {
        const [results] = await connection.query(query);
        return results || [];
    } catch (error) {
        throw new Error(`Error al obtener las categorias: ${error.message}`);
    }
};

exports.getAlleditors = async () => {
    const query = `Select * From editor;`;
    try {
        const [results] = await connection.query(query);
        return results || [];
    } catch (error) {
        throw new Error(`Error al obtener los editores: ${error.message}`);
    }
};