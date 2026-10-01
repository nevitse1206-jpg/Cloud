# Historias de Usuario — PWA Cafetería "Café Aroma"

> Nombre provisional: **Café Aroma**. Cámbialo por el nombre real de la cafetería.

## Roles
- **Cliente (visitante):** persona que consulta el menú desde su celular o computador. No requiere registro.
- **Administrador:** personal de la cafetería que gestiona productos, categorías y precios.

## Épica 1 — Consulta del menú (Cliente)

| ID | Historia | Criterios de aceptación | Prioridad |
|----|----------|-------------------------|-----------|
| HU-01 | Como **cliente** quiero ver la lista de productos con su nombre, foto y precio para saber qué ofrece la cafetería. | - Se muestran solo productos activos.<br>- Cada tarjeta muestra imagen, nombre, descripción corta y precio en COP.<br>- La carga inicial no supera 3 s en 4G. | Alta |
| HU-02 | Como **cliente** quiero filtrar los productos por categoría (cafés, bebidas frías, postres, etc.) para encontrar rápido lo que busco. | - Existe un selector de categorías visible.<br>- Al elegir una categoría solo se listan sus productos.<br>- Hay opción "Todos". | Alta |
| HU-03 | Como **cliente** quiero buscar un producto por nombre para ir directo a lo que quiero. | - El buscador filtra mientras escribo.<br>- Si no hay resultados se muestra un mensaje claro. | Media |
| HU-04 | Como **cliente** quiero ver el detalle de un producto (descripción, ingredientes, tamaños y precios) para decidir mi pedido. | - Al tocar una tarjeta se abre el detalle.<br>- Se listan las variantes (tamaños) con su precio. | Media |
| HU-05 | Como **cliente** quiero ver los productos destacados o promociones para conocer lo más recomendado. | - Sección "Destacados" en la página de inicio.<br>- Solo productos marcados como destacados. | Baja |
| HU-06 | Como **cliente** quiero ver la información de la cafetería (horario, dirección, teléfono y redes) para saber cómo llegar o contactarla. | - Página/sección con horario, dirección, teléfono, WhatsApp y enlace a mapa. | Media |

## Épica 2 — Experiencia PWA (Cliente)

| ID | Historia | Criterios de aceptación | Prioridad |
|----|----------|-------------------------|-----------|
| HU-07 | Como **cliente** quiero instalar la app en mi celular para abrirla como una aplicación más. | - Cumple criterios de instalabilidad (manifest + service worker + HTTPS).<br>- Aparece el ícono de la cafetería en la pantalla de inicio. | Alta |
| HU-08 | Como **cliente** quiero ver el último menú consultado aunque no tenga internet para revisarlo en cualquier lugar. | - Service worker cachea el menú y las imágenes.<br>- Se muestra un aviso "Sin conexión — mostrando menú guardado". | Alta |
| HU-09 | Como **cliente** quiero que la app se vea bien en mi celular, tablet y computador. | - Diseño responsive (mobile-first) con Tailwind. | Alta |

## Épica 3 — Administración (Administrador)

| ID | Historia | Criterios de aceptación | Prioridad |
|----|----------|-------------------------|-----------|
| HU-10 | Como **administrador** quiero iniciar sesión de forma segura para acceder al panel de gestión. | - Login con correo y contraseña.<br>- Se entrega un JWT con expiración.<br>- Rutas del panel protegidas. | Alta |
| HU-11 | Como **administrador** quiero crear, editar y desactivar productos para mantener el menú actualizado. | - Formulario con nombre, descripción, categoría, precio, imagen y estado.<br>- Desactivar oculta el producto sin borrarlo. | Alta |
| HU-12 | Como **administrador** quiero actualizar los precios para reflejar cambios de costos. | - El cambio se refleja en el menú público de inmediato. | Alta |
| HU-13 | Como **administrador** quiero gestionar las categorías (crear, renombrar, ordenar y desactivar). | - No se puede eliminar una categoría con productos asociados activos. | Media |
| HU-14 | Como **administrador** quiero gestionar las variantes de tamaño de un producto con su precio. | - Un producto puede tener 0 o más variantes (Pequeño, Mediano, Grande). | Media |
| HU-15 | Como **administrador** quiero marcar productos como destacados o agotados. | - Un producto agotado se muestra con etiqueta "Agotado". | Baja |
| HU-16 | Como **administrador** quiero editar la información general de la cafetería (horario, contacto). | - Los cambios se muestran en la sección de información pública. | Baja |
