
const connection = require('../../db');
const {formatToday} = require('../Helpers/dateHelper');
const bcrypt = require('bcrypt')



exports.create = async( {nombre, email, contrasena} ) => {

    const contrasena_crypt = await bcrypt.hash(contrasena, 10);

    const query = `
        INSERT INTO user(nombre, email, password, id_status, id_permissions)
        VALUES(?, ?, ?)
    `;

    try{
        await connection.query(query, [nombre, email, contrasena_crypt,1,1]);
    }catch(error){
        throw error;
    }

}

exports.login = async( {email, contrasena} ) => {
    const query = `
        SELECT id_user, nombre, email, password, id_permissions
        FROM usuarios
        WHERE email = ?
    `;
    try{
        [results] = await connection.query(query, [email]);
        if(results.length == 1){
            const usuario = results[0];
            const is_contrasena = await bcrypt.compare(contrasena, usuario.contrasena);
            return (is_contrasena) ? usuario : null;
        }else{
            return null;
        }
    }catch(error){
        throw error;
    }
}

exports.getById = async( {id} ) => {
    const query = `
        SELECT id_user, nombre, email, id_permissions
        FROM usuarios
        WHERE id_user = ?
    `;
    try{
        const [results] = await connection.query(query, [id]);
        return results.length > 0 ? results[0] : null;
    }catch(error){
        throw error;
    }
}