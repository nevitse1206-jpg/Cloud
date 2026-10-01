# Requerimientos — PWA Cafetería "Café Aroma"

## Stack tecnológico
| Capa | Tecnología |
|------|-----------|
| Frontend | React + Tailwind CSS (PWA con `vite-plugin-pwa` / Workbox) |
| Backend | Node.js + Express (API REST) |
| Base de datos | MySQL alojado en Clever Cloud |
| Autenticación | JWT + bcrypt |
| Despliegue sugerido | Frontend: Vercel/Netlify · Backend: Clever Cloud / Render |

## Requerimientos funcionales (RF)

### Módulo público
| ID | Requerimiento | Historia |
|----|---------------|----------|
| RF-01 | El sistema debe listar los productos activos con nombre, imagen, descripción y precio. | HU-01 |
| RF-02 | El sistema debe permitir filtrar productos por categoría. | HU-02 |
| RF-03 | El sistema debe permitir buscar productos por nombre. | HU-03 |
| RF-04 | El sistema debe mostrar el detalle de un producto con sus variantes y precios. | HU-04 |
| RF-05 | El sistema debe mostrar una sección de productos destacados. | HU-05 |
| RF-06 | El sistema debe mostrar la información de la cafetería (horario, dirección, contacto). | HU-06 |
| RF-07 | El sistema debe indicar visualmente los productos agotados. | HU-15 |
| RF-08 | El sistema debe mostrar los precios en pesos colombianos (COP) con formato local. | HU-01 |

### Módulo PWA
| ID | Requerimiento | Historia |
|----|---------------|----------|
| RF-09 | La aplicación debe ser instalable (manifest.json con íconos y colores de marca). | HU-07 |
| RF-10 | La aplicación debe cachear el menú para consulta sin conexión. | HU-08 |
| RF-11 | La aplicación debe informar al usuario cuando está sin conexión. | HU-08 |
| RF-12 | La aplicación debe actualizar el caché cuando haya una nueva versión del menú. | HU-08 |

### Módulo administración
| ID | Requerimiento | Historia |
|----|---------------|----------|
| RF-13 | El sistema debe autenticar administradores con correo y contraseña. | HU-10 |
| RF-14 | El sistema debe permitir crear, leer, actualizar y desactivar productos (CRUD). | HU-11 |
| RF-15 | El sistema debe permitir modificar el precio de un producto. | HU-12 |
| RF-16 | El sistema debe permitir gestionar categorías (CRUD) y su orden de aparición. | HU-13 |
| RF-17 | El sistema debe permitir gestionar variantes de tamaño y su precio. | HU-14 |
| RF-18 | El sistema debe permitir marcar un producto como destacado o agotado. | HU-15 |
| RF-19 | El sistema debe permitir editar la información general de la cafetería. | HU-16 |
| RF-20 | El sistema debe permitir subir o enlazar la imagen de cada producto. | HU-11 |

## Requerimientos no funcionales (RNF)

| ID | Categoría | Requerimiento |
|----|-----------|---------------|
| RNF-01 | Rendimiento | La página principal debe cargar en menos de 3 s en conexión 4G. |
| RNF-02 | Rendimiento | Puntaje Lighthouse ≥ 90 en Performance, PWA y Accesibilidad. |
| RNF-03 | Rendimiento | Las imágenes deben optimizarse (WebP, carga diferida / lazy loading). |
| RNF-04 | Usabilidad | Diseño responsive mobile-first, usable desde 320 px de ancho. |
| RNF-05 | Usabilidad | Navegación clara: máximo 2 toques para llegar a cualquier producto. |
| RNF-06 | Accesibilidad | Contraste de color AA (WCAG 2.1), textos alternativos en imágenes, navegación por teclado. |
| RNF-07 | Seguridad | Toda la comunicación debe ir sobre HTTPS. |
| RNF-08 | Seguridad | Contraseñas almacenadas con hash bcrypt (nunca en texto plano). |
| RNF-09 | Seguridad | Rutas de administración protegidas con JWT y expiración de token. |
| RNF-10 | Seguridad | Consultas SQL parametrizadas para prevenir inyección SQL. |
| RNF-11 | Seguridad | Configuración de CORS restringida al dominio del frontend; uso de `helmet` y *rate limiting*. |
| RNF-12 | Seguridad | Credenciales de Clever Cloud en variables de entorno (`.env`), nunca en el repositorio. |
| RNF-13 | Disponibilidad | El menú debe seguir consultable sin conexión gracias al service worker. |
| RNF-14 | Compatibilidad | Compatible con Chrome, Edge, Firefox, Safari (iOS 16+) y Android 8+. |
| RNF-15 | Mantenibilidad | Código organizado por capas (rutas, controladores, servicios) y componentes reutilizables en React. |
| RNF-16 | Mantenibilidad | API REST documentada (README o Swagger/OpenAPI). |
| RNF-17 | Escalabilidad | Uso de *pool* de conexiones MySQL; el plan gratuito de Clever Cloud limita las conexiones simultáneas, por lo que se debe configurar un máximo bajo (p. ej. 5). |
| RNF-18 | Portabilidad | Variables de configuración separadas por entorno (desarrollo / producción). |

## Endpoints sugeridos de la API

| Método | Ruta | Descripción | Acceso |
|--------|------|-------------|--------|
| GET | `/api/categorias` | Lista categorías activas | Público |
| GET | `/api/productos` | Lista productos (filtros `?categoria=` `?q=` `?destacados=1`) | Público |
| GET | `/api/productos/:id` | Detalle con variantes | Público |
| GET | `/api/cafeteria` | Información de la cafetería | Público |
| POST | `/api/auth/login` | Inicio de sesión | Público |
| POST/PUT/DELETE | `/api/admin/productos` | CRUD productos | Admin |
| POST/PUT/DELETE | `/api/admin/categorias` | CRUD categorías | Admin |
| POST/PUT/DELETE | `/api/admin/variantes` | CRUD variantes | Admin |
| PUT | `/api/admin/cafeteria` | Editar información | Admin |
