// --------------------------------
// iniciar sv con: npx nodemon app.js
// --------------------------------

require('dotenv').config()
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');


const app = express();
const port = 8888;


app.options('*', cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', 'http://localhost:5173');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
});

app.listen(port, () => {
    console.log('Servidor iniciado en: http://localhost:' + port);
});

// User
app.use('/user',require('./src/Routes/userRoutes'));
// Consultas/Support
app.use(require('./src/Routes/supportRoutes'));
// Descuentos
app.use(require('./src/Routes/discountRoutes'));
// Grupos
app.use(require('./src/Routes/groupRoutes'));
// Games
app.use(require('./src/Routes/gameRoutes'));
// UserActions (Purchase + Libreria)
app.use(require('./src/Routes/userActivityRoutes'));
// reviews
app.use(require('./src/Routes/reviewRoutes'));
// editores y categorias
app.use(require('./src/Routes/editorCategoryRoutes'));


// 404 Midelware
// Middleware para manejar el error 404
app.use((req, res, next) => {
    res.status(404);
    res.send(`
        <h1>404 - Página no encontrada</h1>
        <p>Lo sentimos, la página que estás buscando no existe.</p>
    `);
});
