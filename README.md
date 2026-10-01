# Café Aroma — PWA

Aplicación web progresiva de cafetería: muestra productos y precios.

## Stack

- **Frontend:** React + Vite + Tailwind CSS + PWA (`frontend-cloud`)
- **Backend:** Node.js + Express (`backend-cloud`)
- **Base de datos:** MySQL en Clever Cloud

## Arranque local

### 1. Backend

```bash
cd backend-cloud
cp .env.example .env   # completa con tus credenciales MySQL
npm install
npm run db:init        # crea tabla products y datos de ejemplo
npm run dev            # http://localhost:3001
```

> Si `npm run db:init` falla con `ETIMEDOUT`, tu red puede estar bloqueando el puerto **3306**.
> En ese caso abre la consola MySQL de Clever Cloud (o phpMyAdmin del addon) y ejecuta el archivo `backend-cloud/sql/schema.sql`.

### 2. Frontend

```bash
cd frontend-cloud
cp .env.example .env   # VITE_API_URL=http://localhost:3001/api
npm install
npm run dev            # http://localhost:5173
```

## Despliegue en Vercel

Necesitas **dos proyectos** en Vercel:

### A) Backend (`backend-cloud`)

1. New Project → selecciona el repo → **Root Directory:** `backend-cloud`
2. Variables de entorno (Settings → Environment Variables):

| Variable | Valor |
|----------|-------|
| `MYSQL_ADDON_HOST` | host de Clever Cloud |
| `MYSQL_ADDON_DB` | nombre de la BD |
| `MYSQL_ADDON_USER` | usuario |
| `MYSQL_ADDON_PASSWORD` | contraseña |
| `MYSQL_ADDON_PORT` | `3306` |
| `CORS_ORIGIN` | URL del frontend, ej. `https://tu-frontend.vercel.app` |

3. Deploy y copia la URL (ej. `https://cafe-aroma-api.vercel.app`)

### B) Frontend (`frontend-cloud`)

1. New Project → mismo repo → **Root Directory:** `frontend-cloud`
2. Variable: `VITE_API_URL=https://cafe-aroma-api.vercel.app/api`
3. Build: `npm run build` · Output: `dist`

> **Tip:** si Vercel tampoco conecta a MySQL, despliega el backend como app Node en **Clever Cloud** (misma red que la BD) y apunta `VITE_API_URL` a esa URL.
## API

| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/api/health` | Health check |
| GET | `/api/products` | Lista de productos |
| GET | `/api/products/categories` | Categorías |
| GET | `/api/products/:id` | Producto por id |
