const jwt = require('jsonwebtoken');

exports.requireAuth = async (req, res, next) => {
    try {
        const authHeader = req.headers.authorization;
        
        if (!authHeader) {
            return res.status(401).json({ 
                success: false, 
                message: 'Token de autenticación no proporcionado' 
            });
        }

        const [bearer, token] = authHeader.split(' ');
        
        if (bearer !== 'Bearer' || !token) {
            return res.status(401).json({ 
                success: false, 
                message: 'Formato de token no válido' 
            });
        }

        try {
            const decodedToken = jwt.verify(token, process.env.JWT_ACCESS_TOKEN_SECRET);
            req.user = decodedToken;
            next();
        } catch (error) {
            if (error.name === 'TokenExpiredError') {
                return res.status(401).json({ 
                    success: false, 
                    message: 'Token de autenticación expirado',
                    error: 'TOKEN_EXPIRED'
                });
            }
            throw error;
        }
    } catch (error) {
        return res.status(401).json({ 
            success: false, 
            message: 'Token de autenticación inválido',
            error: error.message 
        });
    }
};