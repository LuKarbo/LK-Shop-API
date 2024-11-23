
const connection = require('../../db');
const {formatToday} = require('../Helpers/dateHelper');
const bcrypt = require('bcrypt')

exports.create = async ({ nombre, email, contrasena }) => {
    const contrasenaCrypt = await bcrypt.hash(contrasena, 10);
    const query = `CALL createUser(?, ?, ?)`;

    try {
        await connection.query(query, [nombre, email, contrasenaCrypt]);
        return { success: true, message: "Usuario registrado correctamente" };
    } catch (error) {
        if (error.sqlState === '45000') {
            return { success: false, message: error.sqlMessage };
        }
        throw error;
    }
};

exports.login = async( {email, contrasena} ) => {
    const query = `
        SELECT id_user, nombre, email, password, id_permissions
        FROM user
        WHERE email = ?
    `;
    try{
        [results] = await connection.query(query, [email]);
        if(results.length == 1){
            const usuario = results[0];
            const is_contrasena = await bcrypt.compare(contrasena, usuario.password);
            return (is_contrasena) ? usuario : null;
        }else{
            return null;
        }
    }catch(error){
        throw error;
    }
}

exports.getById = async (id) => { 
    const query = `
        CALL getUser(?);
    `;
    try {
        const [results] = await connection.query(query, [id]);
        return results.length > 0 ? results[0] : null;
    } catch (error) {
        throw error;
    }
}

exports.editUser = async (id, nombre, email, id_permissions, id_status, profileIMG, profileBanner) => {
    const query = `CALL EditUser(?, ?, ?, ?, ?, ?, ?)`;

    try {
        const [results] = await connection.query(query, [
            id,
            nombre || null,
            email || null,
            id_permissions || null,
            id_status || null,
            profileIMG || null,
            profileBanner || null
        ]);

        const rowsAffected = results[0][0].rows_affected;
        
        if (rowsAffected === 0) {
            return {
                success: false,
                message: "No se encontró el usuario o no se realizaron cambios"
            };
        }

        return {
            success: true,
            message: "Usuario actualizado correctamente",
            rowsAffected
        };
    } catch (error) {
        if (error.sqlState === '45000') {
            return { success: false, message: error.sqlMessage };
        }
        throw new Error(`Error al actualizar usuario: ${error.message}`);
    }
};