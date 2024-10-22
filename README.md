# API con Nodemon

Este proyecto utiliza **Nodemon** para facilitar el desarrollo, reiniciando automáticamente el servidor cada vez que se detectan cambios en el código.

## Requisitos

- **Node.js** instalado. Puedes descargarlo desde: [Node.js](https://nodejs.org/).

## Instalación

1. Asegúrate de estar en la carpeta del proyecto.  
2. Instala `nodemon` como dependencia de desarrollo:

```bash
npm install --save-dev nodemon  
```

## Uso

Para iniciar el servidor, ejecuta el siguiente comando:

```bash
npx nodemon app.js  
```

Este comando lanzará el servidor y lo reiniciará cada vez que hagas cambios en los archivos del proyecto.

## Opcional: Script en `package.json`

Si prefieres facilitar el inicio del servidor, añade un script en el archivo `package.json`:

```json
{
    "scripts": {
        "dev": "npx nodemon app.js"
    }
}  
```

Ahora, en lugar de escribir el comando completo, puedes iniciar el servidor con:

```bash
npm run dev  
```
---
