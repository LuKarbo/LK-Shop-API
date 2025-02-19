# 🚀 LK-Shop-API  

**LK-Shop-API** es una API desarrollada para integrarse con **LK-Shop-React**, facilitando la comunicación entre la aplicación web y la base de datos en tiempo real.  

Este proyecto permite gestionar las consultas y la conexión con la base de datos de forma separada del código principal, garantizando una arquitectura más limpia y mantenible.  

Para todas las funcionalidades que requieren autenticación, se utiliza **REFRESH-TOKEN** para evitar el acceso no autorizado a los endpoints.  

## ⚙️ Funcionalidades Principales  

### 🔹 Usuarios (`/user`)  
✅ Registro e inicio de sesión (`POST /register`, `POST /login`).  
✅ Obtener información del usuario (`GET /getUser`, `GET /getUser/:id`).  
✅ Gestión de permisos y estado (`GET /permissions`, `GET /status`).  
✅ Edición de perfil (`PUT /getUser/:id/edit`).  
✅ Edición administrativa (`PUT /getUser/:id/adminEdit`).  
✅ Eliminación de usuario (`DELETE /getUser/:id/delete`).  
✅ Renovación de sesión (`GET /refresh-token`).  

### 🔹 Actividades (`/activities`)  
✅ Historial de compras (`GET /purchases`, `GET /purchases/:userId`).  
✅ Compra y reembolso (`POST /purchase`, `POST /refund`).  

### 🔹 Soporte (`/support`)  
✅ Obtener solicitudes de soporte (`GET /support`, `GET /support/:id`).  
✅ Crear solicitudes y responder (`POST /support`, `POST /support/:id/reply`).  

### 🔹 Reseñas (`/review`)  
✅ Obtener y crear reseñas (`GET /review`, `GET /review/user/:userId`, `POST /review`).  

### 🔹 Grupos (`/groups`)  
✅ Gestión de grupos (`GET /groups`, `GET /groups/user/:userId`).  
✅ Mensajería en grupos (`GET /groups/:groupId/messages`, `POST /groups/:groupId/messages`).  
✅ Creación y administración de grupos (`POST /groups`, `PUT /groups/:groupId`, `DELETE /groups/:groupId`).  
✅ Unirse o salir de un grupo (`POST /groups/:groupId/join`, `PUT /groups/:groupId/leave`).  

### 🔹 Juegos (`/games`)  
✅ Gestión de juegos (`GET /games`, `POST /games`, `PUT /games/:id`, `DELETE /games/:id`).  
✅ Juegos de un usuario (`GET /games/user/:userId`).  
✅ Favoritos (`GET /favorites/:userId`, `POST /favorites`, `DELETE /favorites/:userId/:gameId`).  

### 🔹 Categorías y Editores (`/categories` - `/editors`)  
✅ Obtener categorías (`GET /categories`).  
✅ Obtener editores (`GET /editors`).  

### 🔹 Descuentos (`/discount`)  
✅ Gestión de descuentos (`GET /discount`, `GET /discount/:id`, `POST /discount`, `PUT /discount/:id/edit`).  

## 🛠️ Tecnologías Utilizadas  
- **Node.js** 
- **Express** 
- **SQL**  

## 👨‍💻 Autor  
🔹 **Lucas Karbo**  
