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
    res.header('Access-Control-Allow-Origin', 'http://localhost:8888');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
});

app.listen(port, () => {
    console.log('Servidor iniciado en: http://localhost:' + port);
});

// Llamamos nuestras rutas
app.use(require('./src/Routes/userRoutes'));



// 404 Midelware
// Middleware para manejar el error 404
app.use((req, res, next) => {
    res.status(404);
    res.send(`
        <h1>404 - Página no encontrada</h1>
        <p>Lo sentimos, la página que estás buscando no existe.</p>
    `);
});
