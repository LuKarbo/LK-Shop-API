
const connection = require('../../db');
const bcrypt = require('bcrypt')

exports.create = async ( nombre, email, contrasena ) => {
    console.log(nombre);
    console.log(email);
    console.log(contrasena);
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

exports.login = async (email, password) => {    
    const query = `
        SELECT id_user, nombre, email, password, id_permissions
        FROM user
        WHERE email = ?
    `;
    
    try {
        const [results] = await connection.query(query, [email]);
        
        if (results.length === 0) {
            return null;
        }
        
        const usuario = results[0];
        
        if (!password || !usuario.password) {
            throw new Error('Password or hash is missing');
        }
        
        const isValidPassword = await bcrypt.compare(password, usuario.password);
        
        return isValidPassword ? usuario : null;
    } catch (error) {
        console.error('Error en login:', error);
        throw error;
    }
}

exports.getUsers = async () => { 
    const query = `
        CALL getAllUser();
    `;
    try {
        const [results] = await connection.query(query);
        return results.length > 0 ? results : null;
    } catch (error) {
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

exports.editUser = async (id, nombre, email, bio, id_permissions, id_status, profileIMG, profileBanner) => {
    const query = `CALL EditUser(?, ?, ?, ?, ?, ?, ?, ?)`;

    try {
        const [results] = await connection.query(query, [
            id,
            nombre || null,
            email || null,
            bio || null,
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