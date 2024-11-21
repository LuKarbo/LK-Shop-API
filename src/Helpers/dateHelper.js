// Helpers: Son funciones de uso habitual. Por ejemplo podemos tener un helper 
// para obtener el formato de la fecha y hora actual. dateHelper.js:

exports.formatToday = () => {
    const date = new Date();
    return date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + " " + 
            date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
}
