# Estampa

Tienda Shopify de **tarjetas ilustradas premium importadas**. En español, pensada para Argentina.

Este repo guarda las **customizaciones** que se aplican sobre [Dawn](https://github.com/Shopify/dawn) (el tema oficial gratuito de Shopify). Dawn no vive en este repo: lo descarga el script `setup.sh` para mantener el repo chico y fácil de actualizar.

## Qué viene configurado

- **Paleta**: crema (`#FAF5EC`), terracotta (`#B65E41`), marrón cálido (`#3B2A20`).
- **Tipografías**: Playfair Display (títulos, serif elegante) + Nunito (cuerpo, sans cálida).
- **Home**: banner principal, historia de marca, colección destacada, ocasiones (cumpleaños / amor / nacimiento), columnas de envíos + pagos + empaque, y newsletter.
- **Announcement bar**: envío gratis desde $40.000 y 10% off por transferencia (rotando).
- **Footer**: marca, menús "Tienda" y "Ayuda", políticas, redes, medios de pago.
- **Textos en español** listos para Argentina (MercadoPago, Correo Argentino, Andreani, CABA).

## Cómo ponerlo a andar

### 1. Crear cuenta Shopify

1. Entrá a [shopify.com](https://www.shopify.com) y arrancá la prueba gratis.
2. Cuando te pregunte el país: **Argentina**. Idioma: **Español**. Moneda: **ARS ($)**.

### 2. Instalar Shopify CLI (una sola vez)

Necesitás Node.js 18+. Desde la terminal:

```bash
npm install -g @shopify/cli @shopify/theme
```

### 3. Armar el tema

Desde la raíz del repo:

```bash
bash setup.sh
```

Esto descarga Dawn en la carpeta `dawn/` y le aplica todas las customizaciones de Estampa.

### 4. Levantar el tema en tu tienda

```bash
cd dawn
shopify theme dev --store TU-TIENDA.myshopify.com
```

Te abre una URL local. Cada cambio que hagas en los archivos de `dawn/` se refleja en vivo.

### 5. Publicar el tema

```bash
shopify theme push --unpublished
```

Después desde el admin de Shopify (Online Store > Themes) lo activás.

## Próximos pasos en el admin de Shopify

Estas cosas **no se configuran en el tema sino en el admin**:

1. **Pagos**
   - Instalar app **MercadoPago** desde el Shopify App Store.
   - Activar **Pago manual → Transferencia bancaria** con instrucciones de CBU/alias.
2. **Envíos**
   - Configurar zonas: CABA, GBA, Resto del país.
   - Agregar tarifas por Correo Argentino / Andreani (o apps como Envíopack).
   - Retiro gratis en Palermo como opción local.
3. **Dominio**
   - Comprar `estampa.com.ar` (registrar en [nic.ar](https://nic.ar)) y conectarlo desde Settings > Domains.
4. **Impuestos**: configurar IVA 21% según corresponda.
5. **Políticas legales**: Settings > Policies — generar con plantilla y adaptar a Argentina (cambios, devoluciones, privacidad, términos).
6. **Menús** (Online Store > Navigation):
   - `main-menu`: Inicio, Tarjetas, Ocasiones, Artistas, Sobre nosotros.
   - `footer`: Envíos, Cambios, Contacto, Preguntas frecuentes.
7. **Productos**: cada tarjeta con al menos 2 fotos (frente y dorso/ambiente), descripción, precio ARS.
8. **Colecciones recomendadas** (los handles ya están referenciados en la home):
   - `cumpleanos`
   - `amor`
   - `nacimiento`
9. **Páginas a crear**: `sobre-nosotros`, `artistas`, `envios`, `cambios-y-devoluciones`, `preguntas-frecuentes`.

## Logo, páginas y productos de ejemplo

- **Logo**: `customizations/assets/logo.svg` — wordmark en serif itálico con paleta de la marca. `setup.sh` lo copia a `dawn/assets/logo.svg`. Para usarlo: admin de Shopify > **Online Store > Themes > Customize > Header > Logo**, y seleccionar `logo.svg`.
- **Página "Sobre nosotros"**: `content/sobre-nosotros.html`. Crear la página en admin **Online Store > Pages > Add page** (handle: `sobre-nosotros`), y pegar el HTML en modo "Show HTML" del editor.
- **Productos de ejemplo**: `data/productos-ejemplo.csv` — 10 tarjetas de muestra en formato Shopify (cumpleaños / amor / nacimiento / gracias / disculpas). Importar desde **Products > Import**. No incluye imágenes: después subís las fotos por producto.

## Estructura del repo

```
customizations/
  assets/logo.svg                   → logo SVG
  config/settings_data.json         → paleta, tipografías, estilos globales
  templates/index.json              → home
  templates/page.contact.json       → página de contacto
  sections/header-group.json        → announcement bar + header
  sections/footer-group.json        → footer
content/
  sobre-nosotros.html               → contenido de la página "Sobre nosotros"
data/
  productos-ejemplo.csv             → 10 productos en formato Shopify import
setup.sh                            → descarga Dawn y aplica overlay
README.md                           → este archivo
```

## Personalizar sin tocar código

Una vez subido el tema, el **Editor de Temas** del admin (Online Store > Themes > Customize) te permite cambiar colores, secciones, textos e imágenes sin escribir código. Los cambios se pueden bajar al repo con `shopify theme pull`.

## Licencia

Basado en Dawn, MIT License.
