const user = require("../Models/userModel");
const jwt = require('jsonwebtoken');

exports.register = async (req, res) => {
    const { nombre, email, contrasena } = req.body;

    try {
        const result = await user.create( nombre, email, contrasena );

        if (result.success) {
            res.json({ success: true, message: result.message });
        } else {
            res.status(400).json({ success: false, message: result.message });
        }
    } catch (error) {
        console.error("Error al registrar usuario:", error);
        res.status(500).json({ success: false, message: "Error al intentar registrar al usuario" });
    }
};

exports.login = async(req, res) => {
    const {email, password} = req.body;
    try{
        const usuario = await user.login( email, password );
        if(usuario == null){
            res.json({ success: false, message: 'Credenciales incorrectas' });
        }else{

            const playload = { 
                ID: usuario.id, 
                user: usuario, 
                id_permissions: (usuario.id_permissions == '1') 
            };

            const accessToken = jwt.sign(
                playload, 
                process.env.JWT_ACCESS_TOKEN_SECRET, 
                { expiresIn: '15m' }
            );

            const refreshToken = jwt.sign(
                playload, 
                process.env.JWT_REFRESH_TOKEN_SECRET, 
                { expiresIn: '7d' }
            );

            res.json({
                success: true,
                message: 'Inicio de sesión exitoso',
                user: usuario,
                ID: usuario.id,
                accessToken,
                refreshToken
            });

        }
    }catch(error){
        console.log(error);
        res.status(500).json({ success: false, message: 'Error al intentar iniciar sesión' });
    }
}

exports.refreshToken = (req, res) => {
    const authHeader = req.headers.authorization;
    if (!authHeader) {
        return res.status(401).json({ success: false, message: 'Token de autenticación no proporcionado' });
    }

    const [bearer, token] = authHeader.split(' ');
    if (bearer !== 'Bearer' || !token) {
        return res.status(401).json({ success: false, message: 'Formato de token no válido' });
    }

    try {
        const usuario = jwt.verify(token, process.env.JWT_REFRESH_TOKEN_SECRET);
        const payload = { 
            ID: usuario.ID, 
            user: usuario,
            id_permissions: usuario.id_permissions 
        };
        
        const newAccessToken = jwt.sign(
            payload, 
            process.env.JWT_ACCESS_TOKEN_SECRET, 
            { expiresIn: '15m' }
        );
        
        const newRefreshToken = jwt.sign(
            payload, 
            process.env.JWT_REFRESH_TOKEN_SECRET, 
            { expiresIn: '7d' }
        );
        
        res.json({ 
            success: true, 
            accessToken: newAccessToken,
            refreshToken: newRefreshToken 
        });
    } catch(error) {
        return res.status(401).json({ success: false, message: 'Token de autenticación inválido' });
    }
}

//Ruta protegida
exports.getUsers = async (req, res) => {
    try {
        const users = await user.getUsers();
        res.status(200).json(users);
    } catch (error) {
        console.log("Error al obtener los usuarios:", error);
        res.status(500).json({ message: 'Error al obtener los usuarios', error: error.message });
    }
}

exports.getUser = async (req, res) => {
    try {
        const userId = req.params.id;
        console.log('ID solicitado:', userId);
        
        const userData = await user.getById(userId);
        console.log('Datos del usuario obtenidos:', userData);
        
        if (userData) {
            console.log('Enviando respuesta exitosa');
            res.status(200).json(userData);
        } else {
            console.log('Usuario no encontrado');
            res.status(404).json({ message: 'Usuario no encontrado' });
        }
    } catch (error) {
        console.error("Error completo:", error);
        res.status(500).json({ 
            message: 'Error al obtener usuario', 
            error: error.message,
            stack: error.stack
        });
    }
}

exports.editUser = async (req, res) => {
    const { id } = req.params;
    const { nombre, email, bio, id_permissions, id_status, profileIMG, profileBanner } = req.body;

    if (!nombre && !email && !bio && !id_permissions && !id_status && !profileIMG && !profileBanner) {
        return res.status(400).json({
            success: false,
            message: 'No se proporcionaron datos para actualizar'
        });
    }

    try {
        const userExists = await user.getById(id);
        if (!userExists) {
            return res.status(404).json({
                success: false,
                message: 'Usuario no encontrado'
            });
        }

        const result = await user.editUser(
            id,
            nombre,
            email,
            bio,
            id_permissions,
            id_status,
            profileIMG,
            profileBanner
        );

        if (result.success) {
            const updatedUser = await user.getById(id);
            return res.status(200).json({
                success: true,
                message: result.message,
                user: updatedUser
            });
        } else {
            return res.status(400).json({
                success: false,
                message: result.message
            });
        }
    } catch (error) {
        console.error('Error al actualizar usuario:', error);
        return res.status(500).json({
            success: false,
            message: 'Error al actualizar usuario',
            error: error.message
        });
    }
};