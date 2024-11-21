const user = require("../Models/userModel");
const jwt = require('jsonwebtoken');

exports.register = async (req, res) => {
    const { nombre, email, contrasena } = req.body;

    try {
        const result = await user.create({ nombre, email, contrasena });

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
    const {email, contrasena} = req.body;
    try{
        const usuario = await user.login( {email, contrasena} );
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
exports.getUser = async (req, res) => {
    try {
        const userId = req.params.id;
        const userData = await user.getById(userId);
        
        if (userData) {
            res.status(200).json(userData);
        } else {
            res.status(404).json({ message: 'Usuario no encontrado' });
        }
    } catch (error) {
        console.log("Error al obtener usuario:", error);
        res.status(500).json({ message: 'Error al obtener usuario', error: error.message });
    }
}