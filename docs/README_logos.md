# Logos — Café Aroma

| Archivo | Uso |
|---------|-----|
| `logo_principal.svg` | Logo vertical: pantalla de carga, página de inicio, redes sociales |
| `logo_horizontal.svg` | Encabezado (navbar) de la PWA |
| `icono_pwa.svg` | Ícono de la app (fuente para generar los PNG del manifest) |

## Paleta de colores (configúrala en `tailwind.config.js`)
| Nombre | Hex | Uso |
|--------|-----|-----|
| Espresso | `#3E2A1D` | Texto principal, platillo |
| Café | `#6F4E37` | Color primario, `theme_color` del manifest |
| Caramelo | `#C8956D` | Acentos, botones secundarios |
| Crema | `#F5E9DA` | Fondos, `background_color` del manifest |

```js
// tailwind.config.js
theme: { extend: { colors: {
  espresso: '#3E2A1D', cafe: '#6F4E37', caramelo: '#C8956D', crema: '#F5E9DA'
}}}
```

## Tipografías sugeridas
- Títulos: **Georgia** / Playfair Display (serif)
- Texto: **Inter** / Arial (sans-serif)

## Generar los íconos PNG para la PWA
Los SVG se pueden convertir a los tamaños que exige el manifest (192×192 y 512×512, y una versión *maskable*) con una herramienta como `pwa-asset-generator`:

```bash
npx pwa-asset-generator logos/icono_pwa.svg public/icons --background "#6F4E37" --manifest public/manifest.json
```

## Fragmento de `manifest.json`
```json
{
  "name": "Café Aroma",
  "short_name": "Café Aroma",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#F5E9DA",
  "theme_color": "#6F4E37",
  "icons": [
    { "src": "/icons/icon-192.png", "sizes": "192x192", "type": "image/png" },
    { "src": "/icons/icon-512.png", "sizes": "512x512", "type": "image/png" },
    { "src": "/icons/icon-maskable-512.png", "sizes": "512x512", "type": "image/png", "purpose": "maskable" }
  ]
}
```
