// --------------------------------
// iniciar sv con: npx nodemon app.js
// --------------------------------
//#region Apuntes Rutas
    // // rutas
    // app.get('/userData', (req, res) => {
    //     res.send('Hola, soy una URL de userData');
    // });

    // // ejemplo con todo en la url
    // app.get('/:param1/:param2/:param3', (req, res) => {
    //     const { param1, param2, param3 } = req.params;
    //     res.send(`Estoy en param1: ${param1} con param2: ${param2} y param3: ${param3}`);
    // });

    // // ejemplo de consulta como: /producto?val1=234&val2=234
    // app.get('/products', (req, res) => {
    //     const { val1, val2 } = req.query;  // Captura los parámetros de consulta
        
    //     // Verifica si se proporcionaron val1 y val2
    //     if (val1 && val2) {
    //         return res.send(`Estoy en producto con val1: ${val1} y val2: ${val2}`);
    //     }
        
    //     // Respuesta predeterminada si no se pasaron parámetros
    //     res.send('Hola, soy una URL de products');
    // });

    // app.get('/products/:nombre', (req, res) => {
    //     const {nombre} = req.params;
    //     res.send(`Hola, ${nombre}`);
    // });
//#endregion
// --------------------------------

require('dotenv').config()
const express = require('express');
const bodyParser = require('body-parser');
const db = require('./db');


const app = express();
const port = 8888;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


//Iniciamos el servidor.
app.listen(port, () => {
    console.log('Servidor iniciado en: http://localhost:' + port);
});

// Llamamos nuestras rutas
app.use(require('./src-test/Routes/eventoRoutes'));

// 404 Midelware
// Middleware para manejar el error 404
app.use((req, res, next) => {
    res.status(404);
    res.send(`
        <h1>404 - Página no encontrada</h1>
        <p>Lo sentimos, la página que estás buscando no existe.</p>
        <a href="/">Volver a la página de inicio</a>
    `);
});
